import router from '@ohos.router';
import CommonConstants from '../common/constants/CommonConstants';
import Routes from '../common/constants/Routes';
import Logger from '../common/util/Logger';

@Entry
@Component
struct FirstPage {
  @State message: string = 'First Page';
  TAG = 'FirstPage';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(CommonConstants.FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Blank()

        Button($r('app.string.next'))
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            router.pushUrl({
              url: Routes.secondPage,
              // 页面之间的数据传递，自定义参数
              params: {
                src: 'FirstPage 页面传来数据'
              }
            }).catch((error: Error) => {
              Logger.info(this.TAG, 'FirstPage push error' + JSON.stringify(error));
            });
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LAYOUT_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_bg'))
  }
}