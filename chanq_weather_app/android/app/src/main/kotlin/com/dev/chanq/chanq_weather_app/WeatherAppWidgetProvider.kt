package com.dev.chanq.chanq_weather_app

import android.app.Activity
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.RemoteViews

class WeatherAppWidgetProvider: AppWidgetProvider() {

    /**
     * 앱 위젯은 여러개가 등록 될 수 있는데,
     * 최초의 앱 위젯이 등록 될 때 호출 됩니다. (각 앱 위젯 인스턴스가 등록 될때마다 호출 되는 것이 아님)
     */
    override fun onEnabled(context: Context?) {
        super.onEnabled(context)
    }

    /**
     * 위젯 메타 데이터를 구성 할 때 updatePeriodMillis 라는 업데이트 주기 값을 설정하게 되며, 이 주기에 따라 호출 됩니다.
     * 또한 앱 위젯이 추가 될 떄에도 호출 되므로 Service 와의 상호작용 등의 초기 설정이 필요 할 경우에도 이 메소드를 통해 구현합니다
     */
    override fun onUpdate(
        context: Context?,
        appWidgetManager: AppWidgetManager?,
        appWidgetIds: IntArray?
    ) {
        appWidgetIds?.forEach { appWidgetIds ->
            val strDate = context?.getSharedPreferences(
                        "FlutterSharedPreferences",
                        Context.MODE_PRIVATE
                    )?.getString("flutter.testBackgroundDateTime", "")
            io.flutter.Log.d("[Android]", "WeatherAppWidgetProvider onUpdate strDate : $strDate")

            val pendingIntent = Intent(context, MainActivity::class.java).let {
                PendingIntent.getActivity(context, 0, it, PendingIntent.FLAG_IMMUTABLE)
            }

            val views: RemoteViews = RemoteViews(
                context?.packageName,
                R.layout.item_appwidget
            ).apply {
                setTextViewText(R.id.tv_test, strDate ?: "Data Null")
                setOnClickPendingIntent(R.id.fl_container, pendingIntent)
            }

            appWidgetManager?.updateAppWidget(appWidgetIds, views)
        }
    }
}