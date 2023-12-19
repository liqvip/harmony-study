// LifeCyclePage.ets
import Logger from '../common/util/Logger'
import CommonConstants from '../common/constants/CommonConstants';

@Entry
@Component
struct LifeCyclePage {
  TAG = 'LifeCyclePage'
  @State textColor: Color = Color.Black;

  aboutToAppear() {
    this.textColor = Color.Blue;
    Logger.info(this.TAG, 'aboutToAppear');
  }

  onPageShow() {
    this.textColor = Color.Brown;
    Logger.info(this.TAG, 'onPageShow');
  }

  onPageHide() {
    Logger.info(this.TAG,'onPageHide');
  }

  onBackPress() {
    this.textColor = Color.Red;
    Logger.info(this.TAG, 'onBackPress');
    return false;
  }

  aboutToDisappear() {
    Logger.info(this.TAG, 'aboutToDisappear');
  }

  build() {
    Column() {
      Text($r('app.string.hello_message'))
        .fontSize(CommonConstants.DEFAULT_FONT_SIZE)
        .fontColor(this.textColor)
        .margin(CommonConstants.DEFAULT_MARGIN)
        .fontWeight(FontWeight.Bold)
    }
    .width(CommonConstants.FULL_WIDTH)
  }
}