# To enable ProGuard in your project, edit project.properties
# to define the proguard.config property as described in that file.
#
# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in ${sdk.dir}/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the ProGuard
# include property in project.properties.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep mImageOptions here:

-keepattributes Signature
-optimizationpasses 7
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose
-allowaccessmodification
-repackageclasses
-dontusemixedcaseclassnames
-dontoptimize
-dontskipnonpubliclibraryclassmembers
-ignorewarnings

#支付宝
-keep class com.alipay.android.app.IAlixPay{*;}
-keep class com.alipay.android.app.IAlixPay$Stub{*;}
-keep class com.alipay.android.app.IRemoteServiceCallback{*;}
-keep class com.alipay.android.app.IRemoteServiceCallback$Stub{*;}
-keep class com.alipay.sdk.app.PayTask{ public *;}
-keep class com.alipay.sdk.app.AuthTask{ public *;}

#微信支付
-keep class com.tencent.mm.sdk.modelmsg.WXMediaMessage { *;}
-keep class com.tencent.mm.sdk.modelmsg.** implements com.tencent.mm.sdk.modelmsg.WXMediaMessage$IMediaObject {*;}

#自定义view的混淆
-keep class com.edmodo.cropper.** { *;}
-keep class uk.co.senab.photoview.** { *;}
-keep class com.wanmeizhensuo.zhensuo.common.view.** { *;}


-keep class com.wanmeizhensuo.zhensuo.common.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.common.push.bean.** {*;}
-keep class com.wanmeizhensuo.zhensuo.module.expert.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.home.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.msg.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.personal.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.topic.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.welfare.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.zone.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.search.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.order.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.consult.bean.** { *;}
-keep class com.wanmeizhensuo.zhensuo.module.filter.bean.** { *;}


#推送的混淆
-dontwarn cn.jpush.**
-keep class cn.jpush.** { *; }
-dontwarn com.google.gson.**
-dontwarn com.google.protobuf.**
-keep class com.google.gson.** {*;}
-keep class com.google.protobuf.** {*;}


# gradle 编译脚本中 compile fileTree(dir: 'libs', include: '*.jar') 会默认指定不混淆 libs 中的 jar 包
#jar包
#-libraryjars libs/baidumapapi_v3_2_0.jar
#-libraryjars libs/jpush-sdk-release1.7.2.jar
#-libraryjars libs/umeng-analytics-v5.2.4.jar
#-libraryjars libs/alipaysdk.jar
#-libraryjars libs/alipaysecsdk.jar
#-libraryjars libs/alipayutdid.jar
#-libraryjars ../Altitude_library/libs/nineoldandroids-2.4.0.jar



-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgent
-keep public class * extends android.preference.Preference
-keep public class * extends android.support.v4.app.Fragment
-keep public class * extends android.app.Fragment
-keep public class com.android.vending.licensing.ILicensingService

-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference


# For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
-keepclasseswithmembernames class * {
    native <methods>;
}


-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

# For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keepclassmembers class **.R$* {
    public static <fields>;
}

# The support library contains references to newer platform versions.
# Don't warn about those in case this app is linking against an older
# platform version.  We know about them, and they are safe.
-dontwarn android.support.**

# adding this in to preserve line numbers so that the stack traces
# can be remapped
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

#避免自定义WebView被混淆
# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class com.wanmeizhensuo.zhensuo.common.webview.CustomWebView$JsToNative {
#   public *;
#}
-keep class com.wanmeizhensuo.zhensuo.common.webview.JsToNative { *;}
-keepattributes *Annotation*
-keepattributes *JavascriptInterface*

-keepattributes InnerClasses

-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

#------TuSDK--滤镜和贴纸------------
# 不混淆TuSDK本身的代码id.w
-keep class org.lasque.tusdk.**
-dontwarn org.lasque.tusdk.**
-keep class org.lasque.tusdk.**{public *; protected *; }
-keep class org.lasque.tusdk.core.utils.image.GifHelper{ *; }

# keep setters in Views so that animations can still work.
# see http://proguard.sourceforge.net/manual/examples.html#beans
-keepclassmembers public class * extends android.view.View {
   void set*(***);
   *** get*();
}

-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# The support library contains references to newer platform versions.
# Don't warn about those in case this app is linking against an older
# platform version.  We know about them, and they are safe.
-dontwarn android.support.**
-dontwarn org.apache.commons.**

-keep class android.support.**{ *; }
-keep class org.apache.commons.**{ *; }
-keep class it.sephiroth.android.library.exif2.**{ *; }

# bugly崩溃统计SDK
-keep public class com.tencent.bugly.**{*;}

############################GMComponent#################################
#GMHybrid
-keep class com.gengmei.hybrid.bean.** { *;}
#webview
-keep class com.gengmei.hybrid.core.JsBridge { *;}
-keepattributes *Annotation*
-keepattributes *JavascriptInterface*

#录音的混淆
-dontwarn com.gengmei.utils.MP3Recorder
-keep class com.gengmei.utils.MP3Recorder.** { *;}

#不混淆BuildConfig类及成员
-keep class com.wanmeizhensuo.zhensuo.BuildConfig { *;}

#GMShare
-keep class com.gengmei.share.bean.** { *;}

# SnappyDB
-keep class sun.misc.**
-keep class sun.nio.**
-keep class java.beans.**
-keep class sun.nio.ch.**
-keep class com.snappydb.**
-keep class com.snappydb.internal.DBImpl { *; }
-keep class com.esotericsoftware.kryo.** { *; }
-dontwarn com.esotericsoftware.kryo.**
-dontwarn org.objenesis.instantiator.**

#统计工具相关
-keep class com.gengmei.statistics.** { *;}
-keep class com.gengmei.statistics.bean.** { *;}
-keep class com.gengmei.statistics.service.** { *;}
-keep class com.wanmeizhensuo.zhensuo.common.statistics.StatisticsTag { *;}
#-keep class com.gengmei.statisticssdk.** { *; }

#注解@see http://jakewharton.github.io/butterknife/
-keep class butterknife.** { *; }
-dontwarn butterknife.internal.**
-keep class **$$ViewBinder { *; }
-keepclasseswithmembernames class * {
    @butterknife.* <fields>;
}
-keepclasseswithmembernames class * {
    @butterknife.* <methods>;
}

#fastjson
-dontwarn com.alibaba.fastjson.**
-dontwarn android.support.v4.**

#sharesdk
-keep class android.net.http.SslError
-keep class android.webkit.**{*;}
-dontwarn android.webkit.**
-keep class m.framework.**{*;}
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class **.R$* {*;}
-keep class **.R{*;}
-dontwarn cn.sharesdk.**
-dontwarn **.R$*
-keep public class com.gengmei.doctor.R$*{
    public static final int *;
}

#umeng
-keepclassmembers class * {
   public <init>(org.json.JSONObject);
}

#百度地图混淆
-keep class com.baidu.** { *; }
-keep class vi.com.gdi.bgl.android.**{*;}

#下拉刷新
-keep public class * extends com.handmark.pulltorefresh.library.PullToRefreshListView
-keep class com.handmark.pulltorefresh.library.** { *;}

#图片加载
-keep class com.nostra13.universalimageloader.** { *;}

#http库
-keep class com.loopj.android.http.** { *;}

#retrofit2网络库
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keep class com.gengmei.networking.response.GMResponse{*;}
-keepattributes Signature
-keepattributes Exceptions
############################GMComponent#################################

############################小视频#################################
-keep class tv.danmaku.ijk.** { *; }
-dontwarn tv.danmaku.ijk.**
############################小视频#################################
############################TD移动解析#############################
-dontwarn com.tendcloud.tenddata.**
-keep class com.tendcloud.** {*;}
-keep public class com.tendcloud.tenddata.** { public protected *;}
-keepclassmembers class com.tendcloud.tenddata.**{
public void *(***);
}
-keep class com.talkingdata.sdk.TalkingDataSDK {public *;}
-keep class com.apptalkingdata.** {*;}
############################TD移动解析#############################

############################直播#############################
-keep class com.qiniu.pili.droid.streaming.** { *; }
-keep class com.pili.pldroid.player.** { *; }
-keep class tv.danmaku.ijk.media.player.** {*;}
-keep class com.gengmei.live.bean.** {*;}
############################直播#############################