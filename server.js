const express = require('express');
const app = express();
app.use(express.json());

// Dummy Database (Ooru Shop Stock)
let orders = [];

// 1. Order Place Panra API (Customer App -> Server)
app.post('/api/order', (req, res) => {
    const { customerName, items, address, paymentMethod } = req.body;
    
    const newOrder = {
        orderId: orders.length + 1,
        customerName,
        items,
        address,
        paymentMethod: paymentMethod || 'COD / Kadan',
        status: 'Order Received - 10 Mins Deliverying!',
        time: new Date().toLocaleTimeString()
    };

    orders.push(newOrder);
    
    console.log("New Order Received from Village:", newOrder);
    
    res.status(201).json({
        success: true,
        message: 'Order success! Kadai-kku message poguthu, 10 nimishathula porul varum.',
        order: newOrder
    });
});

// 2. Shopkeeperkku orders-ai kaattura API (Shop Dashboard)
app.get('/api/orders', (req, res) => {
    res.status(200).json({
        success: true,
        totalOrders: orders.length,
        orders: orders
    });
});

// Server Start
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Ooru Blinkit Backend Server running on port ${PORT}`);
});
