package com.example.flutter_android_native

import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.lang.reflect.Method
import android.content.Intent

class MainActivity: FlutterActivity() {

  private val channelMethod = "package com.example.flutter_android_native";
    private lateinit var channel: MethodChannel
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelMethod)
        channel.setMethodCallHandler { call, result ->
           
            var arguments = call.arguments() as Map<String,String>?
           var message = arguments?.get("message")?.toString() ?: "Message"
            if (call.method == "showToast") {
                Toast.makeText(this, message, Toast.LENGTH_LONG).show()
            }
            if(call.method == "openCamera"){
                  val intent = Intent("android.media.action.IMAGE_CAPTURE")
                     startActivity(intent);

            }
        }
    }

}
