# SZCPopoverView
A simple popover View
Update to Swift 5.0

![image](https://github.com/SunZhiC/SZCPopoverView/blob/master/SZCPopoverView/SZCPopoverView/images/show2.gif)

```swift
let popoverView = SZCPopOverView(origin: point, width: 200, height: 100, direction: .bottomLeft)
popoverView.backView.layer.cornerRadius = 5
        
let labelOne = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
labelOne.text = "Take a photo"
let labelTwo = UILabel(frame: CGRect(x: 0, y: 50, width: 200, height: 50))
labelTwo.text = "Choose from library"
        
popoverView.backView.addSubview(labelOne)
popoverView.backView.addSubview(labelTwo)
        
popoverView.popView()

```
It is very easy to use.

1.Creat a popoverView, set its backView‘s origin point,width,height and direction.

2.Add your custom view to backView.

3.Pop popoverView.

4.And more, you could set backView’s property and popoverView's property.

