
import HelloComponent from '../view/HelloComponent'
@Entry
@Component
struct MyComponentPage {
  build() {
    Column(){
      HelloComponent()
      Divider()
      HelloComponent()
    }
  }
}