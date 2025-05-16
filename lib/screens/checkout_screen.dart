import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, this.cartTotal});

  final double? cartTotal;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _address = '', _city = '', _zip = '', _paymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Shipping Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => _name = value!,
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value!,
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City'),
                onSaved: (value) => _city = value!,
                validator: (value) => value!.isEmpty ? 'Enter city' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'ZIP Code'),
                onSaved: (value) => _zip = value!,
                validator: (value) => value!.isEmpty ? 'Enter zip code' : null,
              ),
              const SizedBox(height: 16),
              const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              DropdownButtonFormField(
                value: _paymentMethod,
                items: const [
                  DropdownMenuItem(value: 'Credit Card', child: Text('Credit Card')),
                  DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                ],
                onChanged: (value) => setState(() => _paymentMethod = value!),
              ),
              const SizedBox(height: 16),
              if (widget.cartTotal != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Total: \$${widget.cartTotal!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushReplacementNamed(context, '/order-confirmed', arguments: {
                      'name': _name,
                      'address': _address,
                      'city': _city,
                      'zip': _zip,
                      'paymentMethod': _paymentMethod,
                      'total': widget.cartTotal,
                    });
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}