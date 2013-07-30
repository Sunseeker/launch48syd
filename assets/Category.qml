import bb.cascades 1.0

Container {
    property alias title: categorytitle.text

    horizontalAlignment: HorizontalAlignment.Fill
    layout: DockLayout {
    }
    Label {
        id: categorytitle
        textStyle.fontSize: FontSize.XLarge
        textStyle.fontStyle: FontStyle.Italic
    }
    Divider {
    }
}
