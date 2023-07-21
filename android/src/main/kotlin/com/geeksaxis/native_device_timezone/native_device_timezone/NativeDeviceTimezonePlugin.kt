package com.geeksaxis.native_device_timezone.native_device_timezone

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.content.ContentResolver
import android.content.Context
import android.media.RingtoneManager
import io.flutter.embedding.android.FlutterActivity

class NativeDeviceTimezonePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "native_device_timezone")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "getTimezoneName" -> result.success(getTimezone())
            "getAlarmUri" -> result.success(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM).toString())
            // "drawableToUri" -> {
            //     val resourceName = call.arguments as String
            //     val resourceId = getResourceIdByName(resourceName)
            //     result.success(resourceToUriString(applicationContext, resourceId))
            // }
            else -> result.notImplemented()
        }
    }

    private fun getTimezone(): String {
        return java.util.TimeZone.getDefault().id
    }

    private fun resourceToUriString(context: Context, resId: Int): String {
        return (ContentResolver.SCHEME_ANDROID_RESOURCE
                + "://"
                + context.resources.getResourcePackageName(resId)
                + "/"
                + context.resources.getResourceTypeName(resId)
                + "/"
                + context.resources.getResourceEntryName(resId))
    }

    // private fun getResourceIdByName(resourceName: String): Int {
    //     return resources.getIdentifier(resourceName, "drawable", packageName)
    // }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
