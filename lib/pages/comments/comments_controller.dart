import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/constants.dart';
import 'package:hiringbell/services/http_service.dart';
import 'package:hiringbell/utilities/Util.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CommentsController extends GetxController {
  int postId = Get.arguments as int;
  HttpService http = HttpService.getInstance();
  Util util = Util.getInstance();
  var isLoading = false.obs;
  final ScrollController scrollController = ScrollController();

  var chatMessage = RxList<MessageDetail>([]).obs;
  int counter = 0;

  var isRecording = false.obs;
  FlutterSoundRecord? recorder;
  String recordedFilePath = "";
  Timer? timer;
  Timer? ampTimer;
  Amplitude? amplitude;
  int recordDuration = 0;

  final TextEditingController messageController = TextEditingController();

  Future<String> getTemporaryDirPath() async {
    Directory tempDir = await getTemporaryDirectory();
    return tempDir.path;
  }

  Future<void> stopRecording() async {
    debugPrint("Stop recording...");
    isRecording.value = false;
    await recorder!.stop();
    isRecording.value = false;
    sendAudioMessage();
  }

  Future playRecording() async {
    final player = AudioPlayer();
    await player.setVolume(1);
    final duration = await player.setUrl(recordedFilePath);
    await player.play();
  }

  void startTimer() {
    timer?.cancel();
    ampTimer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      recordDuration++;
    });

    ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      amplitude = await recorder!.getAmplitude();
    });
  }

  Future<void> startRecording() async {
    debugPrint("Start recording...");
    initRecorder();
    isRecording.value = true;

    var tempPath = await getTemporaryDirPath();
    recordedFilePath = "$tempPath/${DateTime.now().microsecondsSinceEpoch}.aac";

    try {
      recorder = FlutterSoundRecord();
      await recorder!.start(
          bitRate: 128000,
          samplingRate: 44100,
          encoder: AudioEncoder.AAC,
          path: recordedFilePath);
    } catch (e) {
      isRecording.value = false;
    }
  }

  Future initRecorder() async {
    debugPrint("Start recording...");

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      util.showToast("Microphone permission not granted", type: Constants.fail);
    }
  }

  void _scrollBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 60,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future sendAudioMessage() async {
    if (recordedFilePath.isNotEmpty) {
      chatMessage.value.add(MessageDetail(
        message: "Message count: ${++counter}",
        isAudioMessage: true,
      ));
      util.showToast("Please record or type a message first");
    }
    _scrollBottom();
  }

  Future sendMessage() async {
    if (recordedFilePath.isNotEmpty) {
      chatMessage.value.add(MessageDetail(
        message: "Message count: ${++counter}",
      ));
      util.showToast("Please record or type a message first");
    }
    _scrollBottom();
  }
}

class MessageDetail {
  bool isAudioMessage = false;
  String message;

  MessageDetail({
    required this.message,
    this.isAudioMessage = false,
  });
}
