<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double zjqye=0;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//获取电子报价金额
	zjqye=dzbj.getBjje(conn,khbh,"hd");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td width="48%" rowspan="2"><span lang=EN-US><img src="../../images/tubiao.jpg" v:shapes="_x0000_i1025"></span><br></td>
	  <td width="20%" rowspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td width="" style='FONT-SIZE: 14px'>公司(总部)地址：深圳市华侨城汉唐大厦六楼  
    </tr>
    <tr>
     <td style='FONT-SIZE: 14px'>  电话：0755-26948699 &nbsp;&nbsp;&nbsp; 0755-26948389   
    </tr>
    <tr>
      <td width="48%" style='FONT-SIZE: 19px'>http://www.szhaida.com</td>
       <td style='FONT-SIZE: 14px'> 传真：0755-26948608
    </tr>
    <tr> 
      <td colspan="4" >
        <div align="center">
          <hr>
          <b><font size="5">工程报价单</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%></td>
    <td>金额总计：<%=cf.formatDouble(zjqye,"#########.##")%>元</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr> 
    <td  colspan="2" align="center"><b><font size="3">提  醒  客  户</font></b>	</td>
    
    
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">一</td>
    
    <td>此报价做为公司常规装饰的指导基价,如有难度大的设计或欧式设计应在此项目报价的基础上向上浮动，但最高上浮不能超过50%。根据市场价格变化，此报价可能每月进行一次微调，合同签定时的单价必须以最新公布的报价为准。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">二</td>
    
    <td>施工中如有漏项、增减项目,应将漏项、增减项目列入结算款中,以实际发生工程量和预算单上工程单价为准，并以现场签证单上双方签字认可为依据进行结算。如预算表上没有相关增加项目单价，按公司近期制定的工程报价表上的价格为准。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">三</td>
    
    <td>客户装修房屋的任何构件（非我方施工主体物件）如可能影响我方施工，无论是拆卸、改造或是用其他办法处理，业主需承担费用。	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">四</td>
    
    <td>此报价不含拉手及锁头、灯具、洁具、厨具、瓷片、地砖、大理石、木地板及预算单上业主要求自购的材料。</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">五</td>
    
    <td>此报价不含管理处各项收费，我公司只交物价局规定装饰公司交纳的装修押金和工人出入证费用。如个别管理处增设其它收费项目（垃圾外运费用，公共设施维护费，工人出入管理费用，现场施工水电费等）本预算内均不包含在内，由业主自行负责。</td>
  </tr>
  <tr> 
    <td  colspan="2" align="center"><b><font size="3">通用材料编制说明	</font></b>	</td>
     </tr>
<tr> 
    <td  WIDTH="3%" align="center">柜类
</td>
    
    <td>柜身采用伟业或力恒15mm框架、层板。柜面背板为伟业或力恒5mm板（如用9mm板另加20元／M2）。柜内贴3mm环保PVC面波音板(若改用饰面板则需补差价45-65元/M2)。长青12mm板做柜门框架，门扇内贴3mm环保PVC面波音板，外面贴饰面板，实木线条封边。汇泰龙三折抽屉滑轨，汇泰龙烟斗铰，美怡或固力柜门吸，不锈钢蚊钉，推拉门采用台湾进口轨道，柜内抽屉按1个／M2为标准制作，超出按80元／个，不包拉手与暗锁。如业主要求变更所用材料，须补差价。	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">门扇</td>
    
    <td>实芯造型门采用伟业或力恒12mm、9mm板整板拼块造型。平板门采用长青12mm板切条框架，伟业或力恒5mm板包双面门板，面贴饰面板，实木线条封边，汇泰龙不锈钢房门合页，不锈钢门吸，不锈钢蚊钉，不包括门锁，木框玻璃门采用长青12mm板做边框门架，实木花格镶中，5mm普通玻璃价值50元/M2，如用艺术玻璃补差价。推拉门轨道另计，采用台湾产超滑轨道，揭阳榕兴无声吊轮。</td>
  </tr>
 
  <tr> 
    <td  WIDTH="3%" align="center">门框</td>
    
    <td>采用伟业或力恒9mm板打底，面贴冠华牌饰面板，60mm×8mm实木线条压边，不锈钢蚊钉。如实木线超出宽度按15元／20mm计，门框厚度为200mm以外须另计。	</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">地面</td>
    
    <td>木地板基础采用伟业或力恒9mm板开条间隔150mm打底，防潮布防潮，业主自购木地板。贴地砖采用丰用R3.25水泥与河砂以1：3配制砂浆，业主自购主材。木制地台采用伟业或力恒12mm框架龙骨层，面贴伟业或力恒12mm板面，不包括地板的安装。卫生间厨房防水处理采用黑豹聚合物水泥基复合防水剂，墙、地面刷两遍。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">天花</td>
    
    <td>复式吊顶造型处采用35mm×25mm杉木方打龙骨架，伟业或力恒9mm板造型，面贴双层伟业或力恒5mm板,刷防火漆按25元/M2计价。平式吊顶部分采用9mm可耐福或泰山纸面石膏板。矿棉板顶、铝扣板顶采用轻钢龙骨不上人型架,铝合金边角。不包面层批灰刷涂料，不包线路费用和灯具。整面复式吊顶以展开面积算,周边单层吊顶距边不足500mm宽按延长米计算，弧形面按最宽距边测量。	</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">墙体</td>
    
    <td>空芯砖，泰柏板建墙采用丰用R3.25水泥与河砂以1：3水泥砂浆配制双面批荡。木隔墙采用伟业或力恒12mm龙骨框架，双面铺伟业或力恒9mm板，如放隔音棉另加50元／M2，不包括批灰、涂料。</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">木器漆</td>
    
    <td>采用海大硝基底漆不少于三遍，海大面漆不少于三遍。</td>
  </tr>


  <tr> 
    <td  WIDTH="3%" align="center">涂料</td>
    
    <td>墙面双飞粉，熟胶粉，龙马牌环保白乳胶拌腻子批灰打磨整平，滚涂乳胶漆一底两面。若使用非白色乳胶漆，则按其总面积计算另加2元/平方（或以备注说明为准）。毛墙面另加3元／M2，铲掉原墙面涂料另加3元／M2  ，如铲掉原基层沙浆批荡费用另行计算，如只包墙面批腻子整平18元／M2 。</td>
  </tr>
 <tr> 
    <td  WIDTH="3%" align="center">电路</td>
    
    <td>强电采用华新或金龙羽单芯强电电线，2.5mm2-4mm2。联塑牌16mm-20mmPVC管，包括杯梳、码仔，弯头、三通配件，管内三根为一组，所有电线连接处，均采用德国WAGO公司生产的弹簧夹持连接器(简称连接器)连接。弱电部分采用双频电视线、友人100-200芯音响线、金龙羽4芯电话线，TCL网络，管内一根为一组，每增加一根线另加3元／M。因结构限制，砼面部分可采用阻燃软管护套，价格不变。</td>
  </tr>
   <tr> 
    <td  WIDTH="3%" align="center">水路
</td>
    
    <td>联塑牌PPR20mm-25mm冷热水管埋设或日丰牌铝塑管20mm-25mm冷热水管。（包括配件）</td>
  </tr>

</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="3%" align="center">序号</td>
    <td  width="9%" align="center">项目编号</td>
    <td  width="15%" align="center">项目名称</td>
    <td  width="7%" align="center">单位</td>
    <td  width="8%" align="center">单价（元）</td>
    <td  width="6%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="44%" align="center">工艺做法及材料说明</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <div align="center"><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		double zcf=0;
		double fcf=0;
		double rgf=0;
		double jjf=0;
		double glfbl=0;
		String bjlx=null;
		String sfxycl=null;

		xjsl=0;
		xjqye=0;

		ls_sql="SELECT bj_bjxmmx.xh xh,bjlx,sfxycl,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,gycl,bj_dwgclzcyl.zcf,bj_bjxmmx.fcf,bj_bjxmmx.rgf,bj_bjxmmx.jjf,bj_bjxmmx.glfbl";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bj_dwgclzcyl,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_gclmx.khbh=bj_dwgclzcyl.khbh(+) and bj_gclmx.dqbm=bj_dwgclzcyl.dqbm(+) and bj_gclmx.xmbh=bj_dwgclzcyl.xmbh(+) and bj_gclmx.jgwzbm=bj_dwgclzcyl.jgwzbm(+)";
		ls_sql+=" order by bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			bjlx=cf.fillNull(rs.getString("bjlx"));
			sfxycl=cf.fillNull(rs.getString("sfxycl"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
//			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			zcf=rs.getDouble("zcf");
			fcf=rs.getDouble("fcf");
			rgf=rs.getDouble("rgf");
			jjf=rs.getDouble("jjf");
			glfbl=rs.getDouble("glfbl");

			if (bjlx.equals("1"))//1:标准项目;2:自定义项目
			{
				if (sfxycl.equals("1"))//1：需要；2：不需要
				{
					dj=(int)((zcf+fcf+rgf+jjf)*(100+glfbl)+0.5)/100.0;
				}
			}

			qye=sl*dj;


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;



			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=cf.formatDouble(dj)%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="8"><b><i><font size="3"><%=oldjgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">其它收费项目</font></i></b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" >&nbsp;</td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><font size="3">其它收费小计：<%=cf.formatDouble(allsfje,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td height="33">甲方签字：</td>
    <td height="33">乙方签字：</td>
  </tr>

</table>
<br>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>

  <tr> 
    <td  WIDTH="3%" align="center">注:</td>
    
    <td align="center" colspan="4">木制品价格现分为红榉类价，胡桃木类价</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">红榉类价包括：樱桃木面板／红榉线条，红榉面板／红榉线条，水曲柳面板／水曲柳线条，胡桃木面板／科技木线条，沙比利面板／沙比利线条。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">胡桃木类价包括：胡桃木面板／胡桃木线条，麦哥利面板／麦哥利线条，白橡面板／白木线条有色手扫漆，橡木面板／橡木线条，枫木面板／枫木线条，樱桃木面板／樱桃木线条。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center"></td>
    
    <td colspan="4">柚木面板/柚木线条：木作部分价格需在胡桃木类价格基础上浮3%。</td>
  </tr>

  <tr> 
    <td  WIDTH="3%" align="center">★1</td>
    
    <td colspan="4">如业主要求用市面上不常用的饰面板，要根据该饰面板市场价格进行换算，现报饰面板价格暂定65.00元/张。</td>
  </tr>
  
<tr> 
    <td  WIDTH="3%" align="center">★2
</td>
    
    <td colspan="4">若饰面板油漆要求索色工艺处理，则以实际展开面积算，每平方米补加35.00元(注：饰面板油漆除刷清漆外均按索色另计费)。</td>
  </tr>
  <tr> 
    <td  WIDTH="3%" align="center">★3</td>
    
    <td colspan="4">此报价是工程项目报价中套用的基本价格,如有特殊工艺要求或设计含量高的项目，视复杂程度高低定位。</td>
  </tr>
 
  <tr> 
    
    
    <td colspan="5">家庭安装按实际数量收费标准	</td>
	</tr>

<tr> 
    <td  WIDTH="3%" align="center">1</td>
    
    <td>开关插座安装	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>5.00 
</td>
	 <td>只人工辅料（灯具,开关插座类）	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">2</td>
    
    <td>大吊灯安装	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>100.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">3</td>
    
    <td>小吊灯安装
	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>40.00 
</td>
	 <td>只人工辅料（灯具,开关插座类）
</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">4</td>
    
    <td>吸顶灯安装
	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">5</td>
    
    <td>壁灯，轨道灯，镜前灯安装
	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">6</td>
    
    <td>灯管支架安装
	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>15.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">7</td>
    
    <td>筒灯，射灯安装
	</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>15.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">8</td>
    
    <td>灯带
	</td>
	 
    <td  WIDTH="" align="center">M
</td>
    
    <td>15.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">9</td>
    
    <td>对讲机安装
</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>20.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">10</td>
    
    <td>门铃安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>20.00 
	</td>
	 <td>只人工辅料（灯具,开关插座类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">11</td>
    
    <td>换气扇安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>35.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">12</td>
    
    <td>热水器安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>60.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">13</td>
    
    <td>水银镜安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">14</td>
    
    <td>座便器安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>80.00 
 
	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">15</td>
    
    <td>毛巾架安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>15.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">16</td>
    
    <td>厕纸盒安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>10.00 
 
	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">17</td>
    
    <td>洗漱挂具安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>15.00 
 
	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">18</td>
    
    <td>单口水笼头安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>15.00 
 
	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">19</td>
    
    <td>冷热水笼头安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">20</td>
    
    <td>台上洗手盆安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 
 
	</td>
	 <td>只人工辅料（洁具类）
）
	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">21</td>
    
    <td>柱式洗手盆安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>30.00 
 
	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">22</td>
    
    <td>冲凉淋浴房安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>150.00 

	</td>
	 <td>只人工辅料（洁具类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">23</td>
    
    <td>装饰挂件安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>10.00 

	</td>
	 <td>只人工辅料（五金、挂件类）

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">24</td>
    
    <td>门锁安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>25.00 

	</td>
	 <td>只人工辅料（五金、挂件类）

	</td>
	
	</tr>
	<tr> 
    <td  colspan="5" align="center">不在家庭安装项目范围安装费用				
</td>
    
    

	
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">1</td>
    
    <td>浴缸安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>250.00 
 
	</td>
	 <td>业主自购主材，人工安装。

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">2</td>
    
    <td>划玻璃园孔

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>40.00 
 
	</td>
	 <td>只人工辅料

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">3</td>
    
    <td>专业开墙孔

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>50.00 

	</td>
	 <td>只人工辅料

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">4</td>
    
    <td>专业开混凝土墙，板孔

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>80.00 

	</td>
	 <td>只人工辅料

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">5</td>
    
    <td>蹲厕安装

</td>
	 
    <td  WIDTH="" align="center">个</td>
    
    <td>180.00  
	</td>
	 <td>
只人工辅料

	</td>
	
	</tr>
	<tr> 
    <td  WIDTH="3%" align="center">注
</td>
    
    <td colspan="4">以上价格均已含工程税金			


	</tr>
	
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>