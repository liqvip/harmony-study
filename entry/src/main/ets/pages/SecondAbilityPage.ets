
import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import CommonConstants from '../common/constants/CommonConstants';

@Entry
@Component
struct SecondAbilityPage {

  @State message: string = 'Second Ability Page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(CommonConstants.FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Blank()

        Button($r('app.string.back'))
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            // 返回
            router.back();
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LAYOUT_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_bg'))
  }

  onBackPress() {
    let handler = getContext(this) as common.UIAbilityContext;
    handler.terminateSelf();
    return true;
  }
}