
@Component
export default struct HelloComponent {
  @State message:string = 'Hello, World';

  build() {
    Row(){
      Text(this.message)
        .fontSize(36)
        .onClick(() => {
          this.message = 'Hello, ArkUI';
        });
    }
  }
}