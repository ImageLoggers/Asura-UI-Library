const express = require('express');
const fs = require('fs').promises;
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// Data storage file
const DATA_FILE = path.join(__dirname, 'pet_data.txt');

// Helper function to format timestamp
function getBaghdadTime() {
    const utcTime = new Date();
    const baghdadTime = new Date(utcTime.getTime() + (3 * 60 * 60 * 1000)); // UTC+3
    return baghdadTime.toISOString().replace('T', ' ').substring(0, 19);
}

// Helper function to append data to file
async function appendToDataFile(data) {
    try {
        const timestamp = `[${data.timestamp}]`;
        const playerInfo = `Server Player Count: ${data.playerCount}/${data.maxPlayers}`;
        const placeInfo = `Place ID: ${data.placeId}`;
        const jobInfo = `Job ID: ${data.jobId}`;
        const playerName = `Target Player: ${data.targetPlayer}`;
        
        let petList = '';
        if (data.pets && data.pets.length > 0) {
            petList = data.pets.map(pet => `- ${pet.name}`).join('\n');
        } else {
            petList = '- No pets found';
        }
        
        const entry = `${timestamp}\n${playerName}\n${playerInfo}\n${placeInfo}\n${jobInfo}\n${petList}\n\n`;
        
        await fs.appendFile(DATA_FILE, entry);
        console.log(`Data appended for player: ${data.targetPlayer} at ${data.timestamp}`);
    } catch (error) {
        console.error('Error writing to data file:', error);
        throw error;
    }
}

// API endpoint to receive pet data (similar to Mine.php)
app.post('/api/pets', async (req, res) => {
    try {
        // Check authorization header
        if (req.headers.authorization !== 'h') {
            return res.status(401).json({ error: 'Unauthorized' });
        }
        
        const data = req.body;
        
        // Validate required fields
        if (!data.targetPlayer || !data.placeId || !data.jobId) {
            return res.status(400).json({ error: 'Missing required fields' });
        }
        
        // Add current timestamp if not provided
        if (!data.timestamp) {
            data.timestamp = getBaghdadTime();
        }
        
        // Save data to file
        await appendToDataFile(data);
        
        res.json({ 
            success: true, 
            message: 'Pet data saved successfully',
            timestamp: data.timestamp,
            petCount: data.pets ? data.pets.length : 0
        });
        
    } catch (error) {
        console.error('Error processing pet data:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// API endpoint to get pet data (similar to oy.txt)
app.get('/api/data', async (req, res) => {
    try {
        const data = await fs.readFile(DATA_FILE, 'utf8');
        res.setHeader('Content-Type', 'text/plain');
        res.send(data);
    } catch (error) {
        if (error.code === 'ENOENT') {
            res.setHeader('Content-Type', 'text/plain');
            res.send('No data available yet.');
        } else {
            console.error('Error reading data file:', error);
            res.status(500).send('Error reading data file');
        }
    }
});

// API endpoint to get JSON formatted data
app.get('/api/data.json', async (req, res) => {
    try {
        const rawData = await fs.readFile(DATA_FILE, 'utf8');
        const entries = parseDataFile(rawData);
        res.json(entries);
    } catch (error) {
        if (error.code === 'ENOENT') {
            res.json([]);
        } else {
            console.error('Error reading data file:', error);
            res.status(500).json({ error: 'Error reading data file' });
        }
    }
});

// Helper function to parse data file into JSON
function parseDataFile(rawText) {
    if (!rawText || rawText.trim() === '') return [];
    
    const entries = [];
    let current = {};
    
    for (const line of rawText.split('\n')) {
        const trimmed = line.trim();
        
        if (trimmed.match(/^\[.+\]$/)) {
            // New timestamp entry
            if (Object.keys(current).length > 0) {
                entries.push(current);
            }
            const timestamp = trimmed.match(/\[(.+)\]/)[1];
            current = {
                timestamp,
                pets: [],
                targetPlayer: '',
                playerCount: '',
                placeId: '',
                jobId: ''
            };
        } else if (trimmed.startsWith('Target Player:')) {
            current.targetPlayer = trimmed.replace('Target Player:', '').trim();
        } else if (trimmed.startsWith('Server Player Count:')) {
            current.playerCount = trimmed.replace('Server Player Count:', '').trim();
        } else if (trimmed.startsWith('Place ID:')) {
            current.placeId = trimmed.replace('Place ID:', '').trim();
        } else if (trimmed.startsWith('Job ID:')) {
            current.jobId = trimmed.replace('Job ID:', '').trim();
        } else if (trimmed.startsWith('- ')) {
            const petName = trimmed.substring(2);
            if (petName !== 'No pets found') {
                current.pets.push(petName);
            }
        }
    }
    
    // Add the last entry
    if (Object.keys(current).length > 0) {
        entries.push(current);
    }
    
    return entries.reverse(); // Most recent first
}

// Health check endpoint
app.get('/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Root endpoint
app.get('/', (req, res) => {
    res.json({ 
        message: 'Pet Tracker API',
        endpoints: {
            'POST /api/pets': 'Submit pet data',
            'GET /api/data': 'Get raw data file',
            'GET /api/data.json': 'Get JSON formatted data',
            'GET /health': 'Health check'
        }
    });
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Pet Tracker API running on port ${PORT}`);
    console.log(`Health check: http://localhost:${PORT}/health`);
});

// Initialize data file if it doesn't exist
async function initializeDataFile() {
    try {
        await fs.access(DATA_FILE);
    } catch (error) {
        if (error.code === 'ENOENT') {
            await fs.writeFile(DATA_FILE, '');
            console.log('Data file initialized');
        }
    }
}

initializeDataFile();
