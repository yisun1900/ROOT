// Fig. 3.01_01: VBar.java
// Java Applet Web图表实例1：绘制书籍销售量统计图之垂直柱状图

import java.awt.*; // 引入 java.awt包中所有的类
import javax.swing.*; // 引入 javax.swing包中所有的类
import java.awt.geom.GeneralPath;

public class VBar extends JApplet
{
  Image offImage;
  Graphics offGraphics;

  int appletWidth = 1000, appletHeight = 800;

 

  // 初始化绘图缓冲区
  public void init()
  {
    offImage = createImage(appletWidth, appletHeight);
    offGraphics = offImage.getGraphics();

   

  }

  public void paint(Graphics g)
  {
    // 调用父类的 paint 方法
    super.paint(g);
    update(g);
	//drawDemo(800, 600, g);

  } // paint 方法结束

  public void update(Graphics g)
  {
	// 绘制标题区域
    offGraphics.setColor(Color.red);
    offGraphics.setFont(new Font("宋体", Font.BOLD, 24));
    offGraphics.drawString("进度计划表", 250, 30);

	// 绘制代表销售量的10条直线
	offGraphics.setFont(new Font("SansSerif", Font.PLAIN, 12));
    int salesValue = 1;
    for (int i = 0; i < 600; i += 20)
    {
      offGraphics.setColor(Color.BLACK);
      offGraphics.drawString("" + salesValue, (i+100), 65);

      offGraphics.setColor(Color.LIGHT_GRAY);
      offGraphics.drawLine((i+100), 70, (i+100), 6000);
      
      salesValue += 1;
    }
	
    
	
	 offGraphics.setColor(Color.BLACK);
	 offGraphics.fill3DRect(100, 90, 400, 10, true);
     offGraphics.setColor(Color.BLACK);
     offGraphics.drawString("计划家装施工", 10, 95);

	 offGraphics.setColor(Color.LIGHT_GRAY);
	 offGraphics.fill3DRect(100, 110, 100, 10, true);
     offGraphics.setColor(Color.BLACK);
     offGraphics.drawString("项目交底", 10, 115);


	 offGraphics.setColor(Color.BLACK);
	 offGraphics.fill3DRect(100, 130, 200, 10, true);
     offGraphics.setColor(Color.BLACK);
     offGraphics.drawString("土建及主材施工", 5, 135);
		

	 offGraphics.setColor(Color.LIGHT_GRAY);
	 offGraphics.fill3DRect(100, 150, 100, 10, true);
     offGraphics.setColor(Color.BLACK);
     offGraphics.drawString("主材施工交底", 10, 155);

	 offGraphics.setColor(Color.LIGHT_GRAY);
	 offGraphics.fill3DRect(100, 170, 160, 10, true);
     offGraphics.setColor(Color.BLACK);
     offGraphics.drawString("土建施工", 10, 175);
    // 绘制坐标系
	offGraphics.setColor(Color.BLACK);
    offGraphics.drawLine(100, 70, 100, 600);
    offGraphics.drawLine(100, 70, 1000, 70);
	
	// 绘制坐标系说明
	 offGraphics.setColor(Color.blue);
    offGraphics.setFont(new Font("宋体", Font.BOLD, 16));
	//offGraphics.setFont(new Font("黑体", Font.BOLD, 16));
    offGraphics.drawString("任务名称", 10, 70);
    offGraphics.drawString("时间", 300, 55);

    // 输出缓冲区图像
	g.drawImage(offImage, 0, 0, null);

  }

   /*public void drawDemo(int w, int h, Graphics g2) 
    { 
        GeneralPath p = new GeneralPath(GeneralPath.WIND_EVEN_ODD); 
        p.moveTo(w*.2f, h*.25f); 

        // adds a cubic curve to the path 
        p.curveTo(w*.4f, h*.5f, w*.6f, 0.0f, w*.8f, h*.25f); 

        p.moveTo(w*.2f, h*.6f); 

        // adds a quad curve to the path 
        p.quadTo(w*.5f, h*1.0f, w*.8f, h*.6f); 

        g2.setColor(Color.lightGray); 
        g2.fill(p); 
        g2.setColor(Color.black); 
        g2.draw(p); 
        g2.drawString("curveTo", (int) (w*.2), (int) (h*.25f)-5); 
        g2.drawString("quadTo", (int) (w*.2), (int) (h*.6f)-5); 
    } 
*/

} //  VBar 类结束


