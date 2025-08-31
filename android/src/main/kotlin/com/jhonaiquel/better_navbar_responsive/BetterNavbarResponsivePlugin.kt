package com.jhonaiquel.better_navbar_responsive

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class BetterNavbarResponsivePlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private var context: Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "better_navbar_responsive")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getNavBarHeight") {
      result.success(getNavigationBarHeight())
    } else {
      result.notImplemented()
    }
  }

  private fun getNavigationBarHeight(): Int {
    val resources = context?.resources
    val resourceId = resources?.getIdentifier("navigation_bar_height", "dimen", "android")
    return if (resourceId != null && resourceId > 0) {
      resources.getDimensionPixelSize(resourceId)
    } else {
      0
    }
  }
}