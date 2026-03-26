import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends MaterialApp {
  const PomodoroApp({super.key})
    : super(home: const TimerScreen(), debugShowCheckedModeBanner: false);
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const int _workDuration = 25 * 60;
  static const int _shortBreakDuration = 5 * 60;
  static const int _longBreakDuration = 10 * 60;

  int _currentDuration = _workDuration;
  late int _timeLeft = _currentDuration;

  bool _isRunning = false;
  Timer? _timer;

  // Dark Green Palette Constants
  static const Color primaryGreen = Color(0xFF1B4332); // Deep Forest Green
  static const Color accentGreen = Color(0xFF2D6A4F); // Mid-tone Green
  static const Color backgroundGreen = Color(0xFF081C15); // Almost Black-Green

  void _setMode(int duration) {
    _timer?.cancel();
    setState(() {
      _currentDuration = duration;
      _timeLeft = duration;
      _isRunning = false;
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_timeLeft > 0) {
            _timeLeft--;
          } else {
            _timer?.cancel();
            _isRunning = false;
          }
        });
      });
    }
    setState(() => _isRunning = !_isRunning);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _timeLeft = _currentDuration;
      _isRunning = false;
    });
  }

  String get _formattedTime {
    int minutes = _timeLeft ~/ 60;
    int seconds = _timeLeft % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildModeButton(String title, int duration) {
    bool isSelected = _currentDuration == duration;
    return ElevatedButton(
      onPressed: () => _setMode(duration),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? accentGreen : Colors.grey.shade100,
        foregroundColor: isSelected ? Colors.white : primaryGreen,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Sleeker iOS-style corners
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGreen,
      appBar: AppBar(
        title: Text(
          'Focus',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white.withValues(
              alpha: 0.95,
            ), // Slight transparency for glass effect
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8,
                children: [
                  _buildModeButton('Work', _workDuration),
                  _buildModeButton('Short', _shortBreakDuration),
                  _buildModeButton('Long', _longBreakDuration),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                _formattedTime,
                style: GoogleFonts.inter(
                  fontSize: 88,
                  fontWeight: FontWeight
                      .w200, // Thinner weight for that high-end iOS look
                  color: primaryGreen,
                  letterSpacing: -2,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Play/Pause Button
                  GestureDetector(
                    onTap: _toggleTimer,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isRunning ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Reset Button
                  IconButton(
                    onPressed: _resetTimer,
                    icon: const Icon(
                      Icons.refresh,
                      color: accentGreen,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
