import 'package:components_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 200;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Slider.adaptive(
                min: 0,
                max: 400,
                activeColor: AppTheme.primary,
                value: _sliderValue,
                thumbColor: AppTheme.secondary,
                onChanged: _sliderEnabled
                    ? (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }
                    : null),
            Checkbox(
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) => setState(
                () {
                  _sliderEnabled = value ?? true;
                },
              ),
            ),
            CheckboxListTile(
              activeColor: AppTheme.primary,
              title: const Text('CheckboxListTile'),
              value: _sliderEnabled,
              onChanged: (value) => setState(
                () => {_sliderEnabled = value ?? true},
              ),
            ),
            Switch.adaptive(
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) => setState(
                () => {_sliderEnabled = value},
              ),
            ),
            SwitchListTile.adaptive(
              activeColor: AppTheme.primary,
              title: const Text('SwitchListTile'),
              value: _sliderEnabled,
              onChanged: (value) => setState(
                () => {_sliderEnabled = value},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage(
                      'https://images.unsplash.com/photo-1567095761054-7a02e69e5c43?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
