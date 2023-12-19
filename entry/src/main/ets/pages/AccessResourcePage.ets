import Logger from '../common/util/Logger'

@Entry
@Component
struct AccessResourcePage {
  TAG = 'AccessResourcePage'

  aboutToAppear() {
    Logger.info(this.TAG, 'aboutToAppear')
  }

  build() {
    Column(){
      Text($r('app.string.hello_message'))
        // declare function $r(value: string, ...params: any[]): Resource;
        // declare type ResourceColor = Color | number | string | Resource;
        .fontColor($r('app.color.red'))
        .fontSize($r('app.float.float_1'))


      // %s 字符串替换
      Text($r('app.string.message_arrive', "five of the clock"))

      //   单复数
      // 第二个参数用于指定单复数(中文语言环境均使用 other), 第三个参数用于替换%d
      Text($r('app.plural.eat_apple', 5, 5))

      // media资源的$r引用
      // media 存放媒体资源，包括图片，音频，视频
      Image($r('app.media.app_icon'))
        .width(100)
        .height(100)


    }
    .alignSelf(ItemAlign.Center)
    .width('100%')
  }
}