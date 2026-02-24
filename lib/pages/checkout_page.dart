import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Checkout 🧾'), backgroundColor: const Color(0xFFF1C9D8)),
      body: cart.isEmpty
    ? const Center(child: Text('Cart kosong.'))
    : ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Order summary
          Card(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...cart.itemsList.map((item) {
                    final p = item.product;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [ 
                          Text(p.emoji, style: const TextStyle(fontSize: 18)),                          
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${p.name} x${item.quantity}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('Rp${item.totalPrice.toStringAsFixed(0)}'),
                        ],
                      ),
                    );
                  }),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Items: ${cart.totalQuantity}'),
                      Text(
                        'Total: Rp${cart.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 46, 106, 48),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Form (center + fixed width)
          Center(
            child: SizedBox(
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Isi nama' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Isi nomor' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _addressCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Isi alamat' : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Submit
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1C9D8),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final name = _nameCtrl.text.trim();
                cart.clear();

                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Success'),
                    content: Text('Order placed! >ᴗ< Thanks, $name.'),
                    actions: [
                      TextButton(style: TextButton.styleFrom(backgroundColor: Color(0xFFF1C9D8)),
                        onPressed: () {
                          Navigator.pop(ctx);
                          Navigator.pop(context);
                        },
                        child: const Text('OK', style: TextStyle(color: Color(0xFF5A4A4D)),),
                      ),
                    ],
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text('Place Order', style: TextStyle(color: Color(0xFF5A4A4D)),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}