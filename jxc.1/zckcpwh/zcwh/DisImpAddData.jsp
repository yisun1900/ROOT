<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dqbm = null;
String getcldlbm=null;
String getclxlbm=null;
String getppmc=null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String ppmc=null;
String cllbbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbmstr=null;
String bzjldwbmstr=null;
String bzggstr=null;
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
String bzjldwbm="";
double bzgg=0;
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

String dqmc="";

int count=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");
	getcldlbm =up.getParameter("cldlbm");
	getclxlbm =up.getParameter("clxlbm");
	getppmc =up.getParameter("ppmc");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">增加新的主材报价（地区：<%=dqmc%>），注意：<font color="#FF0000">红色记录表示该[子品牌、主材名称、型号]已存在</font></div>
<input name="dqbm" type="hidden" value="<%=dqbm%>" >
  <table width="340%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">行号</td>
      <td width="1%">导入序号</td>
      <td width="3%">子品牌</td>
      <td width="3%">品牌</td>
      <td width="5%">供应商</td>
      <td width="4%">类别系列</td>
      <td width="2%">主材编码</td>
      <td width="2%">内部编码</td>
      <td width="5%">主材名称</td>
      <td width="5%">型号</td>
      <td width="4%">规格</td>
      <td width="3%">颜色</td>
      <td width="1%">计量单位</td>
      <td width="2%">包装计量单位</td>
      <td width="2%">包装规格</td>
      <td width="3%">市场标价</td>
      <td width="3%">销售价</td>
      <td width="3%">结算价</td>
      <td width="2%">结算比例</td>
      <td width="2%">计入活动比例</td>
      <td width="1%">有促销</td>
      <td width="3%">促销开始时间</td>
      <td width="3%">促销结束时间</td>
      <td width="3%">促销价</td>
      <td width="3%">促销结算价</td>
      <td width="2%">促销期计入活动比例</td>
      <td width="1%">包含配件</td>
      <td width="1%">配件套数</td>
      <td width="1%">是否有货</td>
      <td width="3%">产品级别</td>
      <td width="4%">风格属性</td>
      <td width="5%">产品说明</td>
      <td width="2%">产地</td>
      <td width="2%">是否推荐产品</td>
      <td width="3%">照片名称</td>
      <td width="6%">备注</td>
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
		cllbbm=outStr[i][2].trim();
		clbm=outStr[i][3].trim();
		nbbm=outStr[i][4].trim();
		clmc=outStr[i][5].trim();
		xh=outStr[i][6].trim();
		gg=outStr[i][7].trim();
		clysbm=outStr[i][8].trim();
		jldwbmstr=outStr[i][9].trim();
		bzjldwbmstr=outStr[i][10].trim();

		bzggstr=outStr[i][11].trim();
		lsjstr=outStr[i][12].trim();
		xsjstr=outStr[i][13].trim();
		cbjstr=outStr[i][14].trim();
		jsblstr=outStr[i][15].trim();
		cxhdblstr=outStr[i][16].trim();
		sfycxstr=outStr[i][17].trim();
		cxkssjstr=outStr[i][18].trim();
		cxjzsjstr=outStr[i][19].trim();
		cxjstr=outStr[i][20].trim();

		cxcbjstr=outStr[i][21].trim();
		lscxhdblstr=outStr[i][22].trim();
		sfbhpjstr=outStr[i][23].trim();
		pjtsstr=outStr[i][24].trim();
		sfyhstr=outStr[i][25].trim();
		cpjb=outStr[i][26].trim();
		fgsx=outStr[i][27].trim();
		cpsm=outStr[i][28].trim();
		cd=outStr[i][29].trim();
		sftjcpstr=outStr[i][30].trim();

		zp=outStr[i][31].trim();
		bz=outStr[i][32].trim();

		if (clmc.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，主材名称不能为空");
			return;
		}

		if (!getppmc.equals(ppmc))
		{
//			out.println("<BR>！！！序号["+xuhao+"]错误，[子品牌名称]不一致，选择【"+getppmc+"】而导入【"+ppmc+"】");
//			return;
		}



		//品牌
		String scsmc=null;
		String gysmc=null;
		String cldlbm=null;
		String clxlbm=null;
		if (ppmc!=null && !ppmc.equals(""))
		{
			sql=" select scsmc,clxl" ;
			sql+=" from jxc_ppxx " ;
			sql+=" where ppmc='"+ppmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				scsmc = rs.getString("scsmc");			    
				clxlbm = rs.getString("clxl");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[子品牌名称]：【"+ppmc+"】");
				return;
			}
			rs.close();
			ps.close();

			sql=" select jxc_ppgysdzb.gysmc" ;
			sql+=" from jxc_ppxx,jxc_ppgysdzb " ;
			sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.ppmc='"+ppmc+"' and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				gysmc = rs.getString("gysmc");			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在[子品牌供应商对照表]：【"+ppmc+"】");
				return;
			}
			rs.close();
			ps.close();


		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[子品牌名称]不能为空");
			return;
		}

		sql=" select cldlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldlbm = rs.getString("cldlmc");			    
		}
		rs.close();
		ps.close();

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
		//包装计量单位
		bzjldwbm="";
		if (bzjldwbmstr!=null && !bzjldwbmstr.equals(""))
		{
			sql=" select jldwmc" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+bzjldwbmstr+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bzjldwbm = rs.getString(1);			    
			}
			else
			{
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[包装计量单位]："+bzjldwbmstr);
				return;
			}

			rs.close();
			ps.close();

		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[包装计量单位]不能为空");
			return;
		}

		//包装规格
		bzgg=1;
		if (bzggstr!=null && !bzggstr.trim().equals(""))
		{
			try{
				bzgg=Double.parseDouble(bzggstr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[包装规格]非数字：" + bzggstr);
				return;
			}
		}
		if (bzgg<1)
		{
			out.print("序号["+xuhao+"]出错！[包装规格]不能小于1：");
			return;
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
			out.print("<BR>序号["+xuhao+"]出错！[计入活动比例]为空");
			return;
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
		}
		else{
			//促销价
			if (cxjstr!=null && !cxjstr.trim().equals("") && !cxjstr.trim().equals("0"))
			{
				out.print("序号["+xuhao+"]出错！因为没有促销，不能有[促销价]");
				return;
			}
			//促销开始时间
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！因为没有促销，不能有[促销开始时间]");
				return;
			}
			//促销结束时间
			if (cxjzsjstr!=null && !cxjzsjstr.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！因为没有促销，不能有[促销结束时间]");
				return;
			}
			if (cxcbjstr!=null && !cxcbjstr.trim().equals("") && !cxcbjstr.trim().equals("0"))
			{
				out.print("序号["+xuhao+"]出错！因为没有促销，不能有[促销结算价]");
				return;
			}
			if (lscxhdblstr!=null && !lscxhdblstr.trim().equals("") && !lscxhdblstr.trim().equals("0"))
			{
				out.print("序号["+xuhao+"]出错！因为没有促销，不能有[计入促销活动比例]");
				return;
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
			sfyh="Y";
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

		if (xh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jxc_clbm,jxc_cljgb " ;
			sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clmc='"+clmc+"' and jxc_clbm.ppmc='"+ppmc+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.xh is null" ;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jxc_clbm,jxc_cljgb " ;
			sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clmc='"+clmc+"' and jxc_clbm.ppmc='"+ppmc+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.xh='"+xh+"'" ;
		}
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
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>" >
      </td>
      <td><%=scsmc%>
        <input name="scsmc" type="hidden" value="<%=scsmc%>" >
      </td>
      <td><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
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
      <td><%=bzjldwbmstr%>
        <input name="bzjldwbm" type="hidden" value="<%=bzjldwbm%>" >
      </td>
      <td><%=bzggstr%>
        <input name="bzgg" type="hidden" value="<%=bzgg%>" >
      </td>
      <td><%=cf.round(lsj,2)%>
        <input name="lsj" type="hidden" value="<%=cf.round(lsj,2)%>" >
      </td>
      <td ><%=cf.round(xsj,2)%>
        <input name="xsj" type="hidden" value="<%=cf.round(xsj,2)%>" >
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
      <td><%=lscxhdblstr%>%
        <input name="lscxhdbl" type="hidden" value="<%=lscxhdbl%>" >
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
      <td align="left"><%=zp%>
        <input name="zp" type="hidden" value="<%=zp%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
      <td colspan="45"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
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
