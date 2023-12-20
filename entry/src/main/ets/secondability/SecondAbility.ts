import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import hilog from '@ohos.hilog';


export default class SecondAbility extends UIAbility {
  domain = 0xff00;
  TAG = 'SecondAbility'

  onCreate(want ,param) {
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/SecondAbilityPage', (err, data) => {

    });
  }

  onForeground() {
    // 申请系统所需的资源或在onBackground中申请释放的资源
    // Ability has brought to foreground
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // UI不可见时释放无用资源，或在此回调中执行耗时操作
    // 例如，状态保存
    // Ability has back to background
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy() {
    // Destroy状态在UIAbility实例销毁时触发。
    // 可以在onDestroy()回调中进行系统资源的释放、数据的保存等操作
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onDestroy');
  }
}