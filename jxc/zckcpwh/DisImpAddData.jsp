<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[] dqbm = null;
String zcbmfs = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String ppmc=null;
String cldlbm=null;
String clxlbm=null;
String cllbbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbmstr=null;
String lsjstr=null;
String xsjstr=null;
String sfbhpjstr=null;
String pjtsstr=null;
String cxhdblstr=null;
String cbjstr=null;
String jsblstr=null;
String cxcbjstr=null;
String lscxhdblstr=null;

String cpjb=null;
String sfyhstr=null;
String sfycxstr=null;
String cxjstr=null;
String cxkssjstr=null;
String cxjzsjstr=null;
String fgsx=null;
String cd=null;
String bz=null;
String sftjcpstr=null;
String sftjcp=null;
String zp=null;
String cpsm=null;


String jldwbm="";
double lsj=0;
double xsj=0;
double cbj=0;
double jsbl=0;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;
double cxhdbl=0;
int pjts=0;
String sfycx="N";
String sfbhpj="N";
String sfyh="N";
double cxcbj=0;
double lscxhdbl=0;

String zdxsjstr=null;
double zdxsj=0;
String yjjrblstr=null;
double yjjrbl=0;
String jsfsstr="";
String jsfs="";
String cxjsblstr=null;
double cxjsbl=0;
String xsfsstr="";
String xsfs="";
String cxyjjrblstr=null;
double cxyjjrbl=0;

String dqmc="";

String bzjldwbm=null;
String bzggStr=null;
String djzlStr=null;
String clcdStr=null;
String clkdStr=null;
String clgdStr=null;
String cgzqStr=null;
String bzqStr=null;
String bztxqStr=null;
String zdkcslStr=null;
String zdkcjeStr=null;

double djzl=0;
double clcd=0;
double clkd=0;
double clgd=0;
int bzgg=0;
int cgzq=0;
int bzq=0;
int bztxq=0;
double zdkcsl=0;
double zdkcje=0;

String cglb=null;
String cglbstr=null;

int count=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameterValues("dqbm");
	zcbmfs =up.getParameter("zcbmfs");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	for (int i=0;i<dqbm.length ;i++ )
	{
		sql=" select dqmc" ;
		sql+=" from dm_dqbm " ;
		sql+=" where dqbm='"+dqbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dqmc+= rs.getString(1)+"、";			    
		}
		rs.close();
		ps.close();
	}

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">增加新的主材报价（地区：<%=dqmc%>），注意：<font color="#FF0000">红色记录表示该[主材编码]已存在</font></div>
  <table width="460%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">序号</td>
      <td width="2%">子品牌</td>
      <td width="2%">材料大类</td>
      <td width="3%">材料小类</td>
      <td width="3%">类别系列</td>
      <td width="2%">主材编码</td>
      <td width="2%">内部编码</td>
      <td width="4%">主材名称</td>
      <td width="4%">型号</td>
      <td width="4%">规格</td>
      <td width="2%">颜色</td>
      <td width="1%">计量单位</td>

	  <td width="1%">包装计量单位</td>
	  <td width="2%">包装规格</td>
	  <td width="2%">单品重量（KG）</td>
	  <td width="1%">长度(cm)</td>
	  <td width="1%">宽度(cm)</td>
      <td width="1%">高度(cm)</td>
      <td width="1%">采购周期（天）</td>
      <td width="1%">保质期（天）</td>
      <td width="1%">保质提醒期（天）</td>

      <td width="2%">市场标价</td>
      <td width="2%">销售价</td>
      <td width="2%">最低销售限价</td>
      <td width="2%">业绩记入比例</td>
      <td width="2%">结算方式</td>
      <td width="2%">结算价</td>
      <td width="1%">结算比例</td>
      <td width="1%">计入活动比例</td>
      <td width="1%">有促销</td>
      <td width="2%">促销开始时间</td>
      <td width="2%">促销结束时间</td>
      <td width="2%">促销价</td>
      <td width="2%">促销结算价</td>
      <td width="1%">促销结算比例</td>
      <td width="1%">促销期计入活动比例</td>
      <td width="1%">促销期业绩记入比例</td>
      <td width="1%">包含配件</td>
      <td width="1%">配件套数</td>
      <td width="1%">是否有货</td>
      <td width="2%">产品级别</td>
      <td width="2%">风格属性</td>
      <td width="2%">产品说明</td>
      <td width="2%">产地</td>
      <td width="1%">是否推荐产品</td>
      <td width="2%">销售方式</td>
      <td width="3%">照片名称</td>
      <td width="5%">备注</td>
      <td width="2%">最低库存数量</td>
      <td width="2%">最低库存金额</td>
      <td width="2%">采购类别</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}


		xuhao=outStr[i][0].trim();
		ppmc=outStr[i][1].trim();
		cldlbm=outStr[i][2].trim();
		clxlbm=outStr[i][3].trim();
		cllbbm=outStr[i][4].trim();
		clbm=outStr[i][5].trim();
		nbbm=outStr[i][6].trim();
		clmc=outStr[i][7].trim();
		xh=outStr[i][8].trim();
		gg=outStr[i][9].trim();
		clysbm=outStr[i][10].trim();

		jldwbmstr=outStr[i][11].trim();
		bzjldwbm=outStr[i][12].trim();
		bzggStr=outStr[i][13].trim();
		djzlStr=outStr[i][14].trim();
		clcdStr=outStr[i][15].trim();
		clkdStr=outStr[i][16].trim();
		clgdStr=outStr[i][17].trim();
		cgzqStr=outStr[i][18].trim();
		bzqStr=outStr[i][19].trim();
		bztxqStr=outStr[i][20].trim();


		lsjstr=outStr[i][21].trim();
		xsjstr=outStr[i][22].trim();
		zdxsjstr=outStr[i][23].trim();
		yjjrblstr=outStr[i][24].trim();
		jsfsstr=outStr[i][25].trim();
		cbjstr=outStr[i][26].trim();
		jsblstr=outStr[i][27].trim();
		cxhdblstr=outStr[i][28].trim();
		sfycxstr=outStr[i][29].trim();

		cxkssjstr=outStr[i][30].trim();
		cxjzsjstr=outStr[i][31].trim();
		cxjstr=outStr[i][32].trim();
		cxcbjstr=outStr[i][33].trim();
		cxjsblstr=outStr[i][34].trim();
		lscxhdblstr=outStr[i][35].trim();
		cxyjjrblstr=outStr[i][36].trim();
		sfbhpjstr=outStr[i][37].trim();
		pjtsstr=outStr[i][38].trim();
		sfyhstr=outStr[i][39].trim();

		cpjb=outStr[i][40].trim();
		fgsx=outStr[i][41].trim();
		cpsm=outStr[i][42].trim();
		cd=outStr[i][43].trim();
		sftjcpstr=outStr[i][44].trim();
		xsfsstr=outStr[i][45].trim();
		zp=outStr[i][46].trim();
		bz=outStr[i][47].trim();
		zdkcslStr=outStr[i][48].trim();
		zdkcjeStr=outStr[i][49].trim();
		cglbstr=outStr[i][50].trim();

		if (clmc.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，主材名称不能为空");
			return;
		}

		count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlbm+"'" ;
		sql+=" and cldllb in('1','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();


		if (count==0)
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[材料大类]：【"+cldlbm+"】");
		}

		count=0;

		sql=" select count(*)" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cldlbm+"'" ;
		sql+=" and clxlmc='"+clxlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();


		if (count==0)
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，材料大类中不存在[材料小类]：【"+clxlbm+"】");
		}

		//品牌
		String getcldlbm=null;
		if (ppmc!=null && !ppmc.equals(""))
		{
			sql=" select cldl" ;
			sql+=" from jxc_ppxx " ;
			sql+=" where ppmc='"+ppmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getcldlbm = rs.getString("cldl");			    
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[子品牌名称]：【"+ppmc+"】");
//				return;
			}
			rs.close();
			ps.close();

			if (!getcldlbm.equals(cldlbm))
			{
				out.println("<BR>！！！序号["+xuhao+"]错误，[子品牌]与[材料大类]无对应关系");
//				return;
			}
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[子品牌名称]不能为空");
			return;
		}

		//计量单位
		jldwbm="";
		if (jldwbmstr!=null && !jldwbmstr.equals(""))
		{
			sql=" select jldwmc" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbmstr+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[计量单位]："+jldwbmstr);
				return;
			}

			rs.close();
			ps.close();

		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[计量单位]不能为空");
			return;
		}


		if (bzjldwbm.equals(""))
		{
			out.println("！！！内部编码["+nbbm+"]错误，[包装计量单位]为空");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+bzjldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("<BR>！！！内部编码["+nbbm+"]错误，不存在的[包装计量单位]："+bzjldwbm);
				return;
			}
		}


		if (bzggStr.equals(""))
		{
			out.println("！！！内部编码["+nbbm+"]错误，[包装规格]为空");
			return;
		}
		else{
			try{
				bzgg=Integer.parseInt(bzggStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[包装规格:"+bzggStr+"]不是数字:"+e);
				return;
			}
		}

		if (djzlStr.equals(""))
		{
			djzl=0;
		}
		else{
			try{
				djzl=Double.parseDouble(djzlStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[单品重量:"+djzlStr+"]不是数字:"+e);
				return;
			}
		}

		if (clcdStr.equals(""))
		{
			clcd=0;
		}
		else{
			try{
				clcd=Double.parseDouble(clcdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[长度:"+clcdStr+"]不是数字:"+e);
				return;
			}
		}

		if (clkdStr.equals(""))
		{
			clkd=0;
		}
		else{
			try{
				clkd=Double.parseDouble(clkdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[宽度:"+clkdStr+"]不是数字:"+e);
				return;
			}
		}

		if (clgdStr.equals(""))
		{
			clgd=0;
		}
		else{
			try{
				clgd=Double.parseDouble(clgdStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[高度:"+clgdStr+"]不是数字:"+e);
				return;
			}
		}

		if (cgzqStr.equals(""))
		{
			cgzq=0;
		}
		else{
			try{
				cgzq=Integer.parseInt(cgzqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[采购周期:"+cgzqStr+"]不是数字:"+e);
				return;
			}
		}

		if (bzqStr.equals(""))
		{
			bzq=0;
		}
		else{
			try{
				bzq=Integer.parseInt(bzqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[保质期:"+bzqStr+"]不是数字:"+e);
				return;
			}
		}

		if (bztxqStr.equals(""))
		{
			bztxq=0;
		}
		else{
			try{
				bztxq=Integer.parseInt(bztxqStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[保质提醒期:"+bztxqStr+"]不是数字:"+e);
				return;
			}
		}
	
		
		
		//市场标价
		lsj=0;
		if (lsjstr!=null && !lsjstr.trim().equals(""))
		{
			try{
				lsj=Double.parseDouble(lsjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[市场标价]非数字：" + lsjstr);
				return;
			}
		}
		//销售价
		xsj=0;
		if (xsjstr!=null && !xsjstr.trim().equals(""))
		{
			try{
				xsj=Double.parseDouble(xsjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[销售价]非数字：" + xsjstr);
				return;
			}
		}
		//最低销售限价
		zdxsj=0;
		if (zdxsjstr!=null && !zdxsjstr.trim().equals(""))
		{
			try{
				zdxsj=Double.parseDouble(zdxsjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[最低销售限价]非数字：" + zdxsjstr);
				return;
			}
		}
		//业绩记入比例
		yjjrbl=100;
		if (yjjrblstr!=null && !yjjrblstr.trim().equals(""))
		{
			try{
				yjjrbl=Double.parseDouble(yjjrblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[业绩记入比例]非数字：" + yjjrblstr);
				return;
			}
		}
		//结算方式
		jsfs="1";//1：结算价；2：结算比例
		if (jsfsstr!=null && !jsfsstr.equals(""))
		{
			if (jsfsstr.equals("结算价"))
			{
				jsfs="1";
			}
			else if (jsfsstr.equals("结算比例"))
			{
				jsfs="2";
			}
			else{
				jsfsstr="结算价";
				jsfs="1";
			}
		}
		//结算价
		cbj=0;
		if (cbjstr!=null && !cbjstr.trim().equals(""))
		{
			try{
				cbj=Double.parseDouble(cbjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[结算价]非数字：" + cbjstr);
				return;
			}
		}
		//结算比例
		jsbl=0;
		if (jsblstr!=null && !jsblstr.trim().equals(""))
		{
			try{
				jsbl=Double.parseDouble(jsblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[结算比例]非数字：" + jsblstr);
				return;
			}
		}
		if (jsfs.equals("1") && cbj==0)
		{
			out.print("<P>提醒！序号["+xuhao+"][结算价]为0");
		}
		if (jsfs.equals("2") && jsbl==0)
		{
			out.print("<P>提醒！序号["+xuhao+"][结算比例]为0");
		}

		//促销价
		cxj=0;
		if (cxjstr!=null && !cxjstr.trim().equals(""))
		{
			try{
				cxj=Double.parseDouble(cxjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销价]非数字：" + cxjstr);
				return;
			}
		}
		//促销开始时间
		cxkssj=null;
		if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
		{
			try{
				cxkssj=java.sql.Date.valueOf(cxkssjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销开始时间]非日期：" + cxkssjstr);
				return;
			}
		}
		//促销结束时间
		cxjzsj=null;
		if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
		{
			try{
				cxjzsj=java.sql.Date.valueOf(cxjzsjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销结束时间]非日期：" + cxjzsjstr);
				return;
			}
		}
		//计入活动比例
		cxhdbl=0;
		if (cxhdblstr!=null && !cxhdblstr.trim().equals(""))
		{
			try{
				cxhdbl=Double.parseDouble(cxhdblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[计入活动比例]非数字：" + cxhdblstr);
				return;
			}
		}
		else{
			cxhdbl=0;
		}

		//促销结算价
		cxcbj=0;
		if (cxcbjstr!=null && !cxcbjstr.trim().equals(""))
		{
			try{
				cxcbj=Double.parseDouble(cxcbjstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销结算价]非数字：" + cxcbjstr);
				return;
			}
		}
		//促销结算比例
		cxjsbl=0;
		if (cxjsblstr!=null && !cxjsblstr.trim().equals(""))
		{
			try{
				cxjsbl=Double.parseDouble(cxjsblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销结算比例]非数字：" + cxjsblstr);
				return;
			}
		}

		//促销期计入活动比例
		lscxhdbl=0;
		if (lscxhdblstr!=null && !lscxhdblstr.trim().equals(""))
		{
			try{
				lscxhdbl=Double.parseDouble(lscxhdblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[计入促销活动比例]非数字：" + lscxhdblstr);
				return;
			}
		}
		
		//促销期业绩记入比例
		cxyjjrbl=100;
		if (cxyjjrblstr!=null && !cxyjjrblstr.trim().equals(""))
		{
			try{
				cxyjjrbl=Double.parseDouble(cxyjjrblstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[促销期业绩记入比例]非数字：" + cxyjjrblstr);
				return;
			}
		}
		
		//是否有促销
		sfycx="N";
		if (sfycxstr!=null && !sfycxstr.equals(""))
		{
			if (sfycxstr.equals("是"))
			{
				sfycx="Y";
			}
			else if (sfycxstr.equals("否"))
			{
				sfycx="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否有促销]只能是【是】或【否】："+sfycxstr);
				return;
			}
		}
		
		if (sfycx.equals("Y"))
		{
			//促销价
			if (cxjstr==null || cxjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销价]不存在");
				return;
			}
			//促销开始时间
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销开始时间]不存在");
				return;
			}
			//促销结束时间
			if (cxjzsjstr==null || cxjzsjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销结束时间]不存在");
				return;
			}
			if (cxcbjstr==null || cxcbjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销结算价]不存在");
				return;
			}
			if (lscxhdblstr==null || lscxhdblstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销期计入活动比例]不存在");
				return;
			}
			if (cxyjjrblstr==null || cxyjjrblstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]出错！因为有促销，[促销期业绩记入比例]不存在");
				return;
			}

			if (jsfs.equals("1") && cxcbj==0)
			{
				out.print("<P>提醒！序号["+xuhao+"][促销结算价]为0");
			}
			if (jsfs.equals("2") && cxjsbl==0)
			{
				out.print("<P>提醒！序号["+xuhao+"][促销结算比例]为0");
			}
		}
		else{
			//促销价
			if (cxjstr!=null && !cxjstr.trim().equals("") && !cxjstr.trim().equals("0"))
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[促销价]");
				cxjstr="";
				cxj=0;
			}
			//促销开始时间
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[促销开始时间]");
				cxkssjstr="";
			}
			//促销结束时间
			if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[促销结束时间]");
				cxjzsjstr="";
			}
			if (cxcbjstr!=null && !cxcbjstr.trim().equals("") && !cxcbjstr.trim().equals("0"))
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[促销结算价]");
				cxcbjstr="";
				cxcbj=0;
			}
			if (lscxhdblstr!=null && !lscxhdblstr.trim().equals("") && !lscxhdblstr.trim().equals("0"))
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[计入促销活动比例]");
				lscxhdblstr="";
				lscxhdbl=0;
			}
			if (cxyjjrbl!=0)
			{
				out.print("<BR>序号["+xuhao+"]提醒！因为没有促销，不能有[促销期业绩记入比例]:"+cxyjjrbl);
//				cxyjjrblstr="";
//				cxyjjrbl=0;
			}
		}

		//是否包含配件
		sfbhpj="N";
		if (sfbhpjstr!=null && !sfbhpjstr.equals(""))
		{
			if (sfbhpjstr.equals("是"))
			{
				sfbhpj="Y";
			}
			else if (sfbhpjstr.equals("否"))
			{
				sfbhpj="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否包含配件]只能是【是】或【否】："+sfbhpjstr);
				return;
			}
		}
		//配件套数
		pjts=0;
		if (pjtsstr!=null && !pjtsstr.trim().equals(""))
		{
			try{
				pjts=Integer.parseInt(pjtsstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[配件套数]非数字：" + pjtsstr);
				return;
			}
		}

		//是否有货
		sfyh="Y";
		if (sfyhstr!=null && !sfyhstr.equals(""))
		{
			if (sfyhstr.equals("是"))
			{
				sfyh="Y";
			}
			else if (sfyhstr.equals("否"))
			{
				sfyh="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否有货]只能是【是】或【否】："+sfyhstr);
				return;
			}
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[是否有货]为空");
			return;
		}

		//是否推荐产品
		sftjcp="N";
		if (sftjcpstr!=null && !sftjcpstr.equals(""))
		{
			if (sftjcpstr.equals("是"))
			{
				sftjcp="Y";
			}
			else if (sftjcpstr.equals("否"))
			{
				sftjcp="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否推荐产品]只能是【是】或【否】："+sftjcpstr);
				return;
			}
		}
		else{
			sftjcp="N";
		}


		//销售方式
		xsfs="3";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
		if (xsfsstr!=null && !xsfsstr.equals(""))
		{
			if (xsfsstr.equals("现货销售"))
			{
				xsfs="2";
			}
			else if (xsfsstr.equals("期货销售"))
			{
				xsfs="3";
			}
			else{
				xsfsstr="期货销售";
				xsfs="3";
			}
		}
		
		
		//最低库存数量
		zdkcsl=0;
		if (zdkcslStr!=null && !zdkcslStr.trim().equals(""))
		{
			try{
				zdkcsl=Double.parseDouble(zdkcslStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[最低库存数量]非数字：" + zdkcslStr);
				return;
			}
		}

		
		//最低库存金额
		zdkcje=0;
		if (zdkcjeStr!=null && !zdkcjeStr.trim().equals(""))
		{
			try{
				zdkcje=Double.parseDouble(zdkcjeStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[最低库存金额]非数字：" + zdkcjeStr);
				return;
			}
		}

		
		if (cglbstr.equals("集团采购"))
		{
			cglb="J";
		}
		else if (cglbstr.equals("地方采购"))
		{
			cglb="D";
		}
		else if (cglbstr.equals(""))
		{
			cglb="D";
			cglbstr="地方采购";
			out.println("<BR>序号["+xuhao+"]提醒！[采购类别]为空，默认为【地方采购】");
		}
		else{
			out.println("<BR>序号["+xuhao+"]出错！[采购类别]只能为【集团采购、地方采购】，目前为["+cglbstr+"]");
			return;
		}

		if (zcbmfs.equals("2"))//主材编码导入
		{
			if (clbm.equals(""))
			{
				out.println("<BR>序号["+xuhao+"]出错！[主材编码】为空");
//				return;
			}
			else if (clbm.length()!=13)
			{
				out.println("<BR>序号["+xuhao+"]出错！[主材编码】长度应为13位:"+clbm);
//				return;
			}
			else
			{
				if (!clbm.startsWith("ZC2"))
				{
					out.println("<BR>序号["+xuhao+"]出错！[主材编码】应该以【ZC2】开头:"+clbm);
	//				return;
				}
				else{
					try
					{
						Integer.parseInt(clbm.substring(3,13));
					}
					catch(Exception e)
					{
						out.println("<BR>序号["+xuhao+"]出错！[主材编码】后10位应该是数字:"+clbm.substring(3,13));
		//				return;
					}
				}
			}
			sql=" select count(*)" ;
			sql+=" from jxc_clbm " ;
			sql+=" where  clbm='"+clbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count>0)
			{
				bgcolor="#FF0000";
			}
		}
		else{
			clbm="";
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td><%=cldlbm%>
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
      </td>
      <td><%=clxlbm%>
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
      </td>
      <td><%=cllbbm%>
        <input name="cllbbm" type="hidden" value="<%=cllbbm%>" >
      </td>
	  <td ><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>" >
      </td>
	  <td ><%=nbbm%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
      <td><%=clmc%>
        <input name="clmc" type="hidden" value="<%=clmc%>" >
      </td>
	  <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td><%=clysbm%>
        <input name="clysbm" type="hidden" value="<%=clysbm%>" >
      </td>
      <td><%=jldwbmstr%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=bzjldwbm%>
        <input name="bzjldwbm" type="hidden" value="<%=bzjldwbm%>" >
      </td>
      <td> <%=bzggStr%>
        <input name="bzgg" type="hidden" value="<%=bzgg%>" >
      </td>
      <td> <%=djzlStr%>
        <input name="djzl" type="hidden" value="<%=djzl%>" >
      </td>
      <td> <%=clcdStr%>
        <input name="clcd" type="hidden" value="<%=clcd%>" >
      </td>
      <td> <%=clkdStr%>
        <input name="clkd" type="hidden" value="<%=clkd%>" >
      </td>
      <td ><%=clgdStr%>
        <input name="clgd" type="hidden" value="<%=clgd%>" >
      </td>
      <td ><%=cgzqStr%>
        <input name="cgzq" type="hidden" value="<%=cgzq%>" >
      </td>
      <td ><%=bzqStr%>
        <input name="bzq" type="hidden" value="<%=bzq%>" >
      </td>
      <td ><%=bztxqStr%>
        <input name="bztxq" type="hidden" value="<%=bztxq%>" >
      </td>
      <td><%=cf.round(lsj,2)%>
        <input name="lsj" type="hidden" value="<%=cf.round(lsj,2)%>" >
      </td>
      <td ><%=cf.round(xsj,2)%>
        <input name="xsj" type="hidden" value="<%=cf.round(xsj,2)%>" >
      </td>
      <td ><%=zdxsj%>
        <input name="zdxsj" type="hidden" value="<%=zdxsj%>" >
      </td>
      <td ><%=yjjrbl%>
        <input name="yjjrbl" type="hidden" value="<%=yjjrbl%>" >
      </td>
      <td ><%=jsfsstr%>
        <input name="jsfs" type="hidden" value="<%=jsfs%>" >
      </td>
      <td><%=cf.round(cbj,2)%>
        <input name="cbj" type="hidden" value="<%=cf.round(cbj,2)%>" >
      </td>
      <td><%=jsblstr%>%
        <input name="jsbl" type="hidden" value="<%=jsbl%>" >
      </td>
      <td><%=cxhdblstr%>%
        <input name="cxhdbl" type="hidden" value="<%=cxhdbl%>" >
      </td>
      <td><%=sfycxstr%>
        <input name="sfycx" type="hidden" value="<%=sfycx%>" >
      </td>
      <td><%=cxkssjstr%>
        <input name="cxkssj" type="hidden" value="<%=cxkssjstr%>" >
      </td>
      <td><%=cxjzsjstr%>
        <input name="cxjzsj" type="hidden" value="<%=cxjzsjstr%>" >
      </td>
      <td><%=cxjstr%>
        <input name="cxj" type="hidden" value="<%=cxj%>" >
      </td>
      <td><%=cxcbjstr%>
        <input name="cxcbj" type="hidden" value="<%=cxcbj%>" >
      </td>
      <td><%=cxjsbl%>
        <input name="cxjsbl" type="hidden" value="<%=cxjsbl%>" >
      </td>
      <td><%=lscxhdblstr%>%
        <input name="lscxhdbl" type="hidden" value="<%=lscxhdbl%>" >
      </td>
      <td><%=cxyjjrblstr%>%
        <input name="cxyjjrbl" type="hidden" value="<%=cxyjjrbl%>" >
      </td>
      <td><%=sfbhpjstr%>
        <input name="sfbhpj" type="hidden" value="<%=sfbhpj%>" >
      </td>
      <td><%=pjtsstr%>
        <input name="pjts" type="hidden" value="<%=pjts%>" >
      </td>
      <td><%=sfyhstr%>
        <input name="sfyh" type="hidden" value="<%=sfyh%>" >
      </td>
      <td><%=cpjb%>
        <input name="cpjb" type="hidden" value="<%=cpjb%>" >
      </td>
      <td><%=fgsx%>
        <input name="fgsx" type="hidden" value="<%=fgsx%>" >
      </td>
      <td align="left"><%=cpsm%>
        <input name="cpsm" type="hidden" value="<%=cpsm%>" >
      </td>
      <td><%=cd%>
        <input name="cd" type="hidden" value="<%=cd%>" >
      </td>
      <td><%=sftjcpstr%>
        <input name="sftjcp" type="hidden" value="<%=sftjcp%>" >
      </td>
      <td><%=xsfsstr%>
        <input name="xsfs" type="hidden" value="<%=xsfs%>" >
      </td>
      <td align="left"><%=zp%>
        <input name="zp" type="hidden" value="<%=zp%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td ><%=zdkcslStr%>
        <input name="zdkcsl" type="hidden" value="<%=zdkcsl%>" >
      </td>
      <td ><%=zdkcjeStr%>
        <input name="zdkcje" type="hidden" value="<%=zdkcje%>" >
      </td>
      <td ><%=cglbstr%>
        <input name="cglb" type="hidden" value="<%=cglb%>" >
      </td>
    </tr>
    <%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("序号["+xuhao+"]出错：" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	outStr=null; 

	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="53"> 
<%
for (int i=0;i<dqbm.length ;i++ )
{
	%>
	<input name="dqbm" type="hidden" value="<%=dqbm[i]%>" >
	<%
}
%>
		<input name="zcbmfs" type="hidden" value="<%=zcbmfs%>" >
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
        <input type="button"  value="重新存盘" onClick="bc.disabled=false;">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
