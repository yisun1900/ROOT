<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String ls=null;

String khxm=null;
String xb=null;
String xbstr=null;
String lxfs=null;
String qtdh=null;
String cqbm=null;
String cqbmstr=null;
String xqbm=null;
String louhao=null;
String fwdz=null;
int fwmj=0;
String fwmjstr=null;

String xxlybm=null;
String xxlybmstr=null;
String xxlysm=null;
String sfxhf=null;
String sfxhfstr=null;
java.sql.Date hfrq=null;
String hfrqstr=null;
String jzbz=null;
String jzbzstr=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;
String zxdm=null;
String fgsmc=null;
String fgsbh=null;

String clgw=null;
String hth=null;
double sjf=0;
String sjfstr=null;
double lfdj=0;
String lfdjstr=null;
java.sql.Date jsjfsj=null;
String jsjfsjstr=null;
java.sql.Date jlfdjsj=null;
String jlfdjsjstr=null;


java.sql.Date yjzxsj=null;
String yjzxsjstr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrsjstr=null;
String zxdjbm=null;
String zxdjbmstr=null;


java.sql.Date ctsj=null;
String ctsjstr=null;
java.sql.Date jhctsj=null;
String jhctsjstr=null;

java.sql.Date cxgtsj=null;
String cxgtsjstr=null;
java.sql.Date jhcxgtsj=null;
String jhcxgtsjstr=null;

java.sql.Date csgtsj=null;
String csgtsjstr=null;
java.sql.Date jhcsgtsj=null;
String jhcsgtsjstr=null;

java.sql.Date sczbjsj=null;
String sczbjsjstr=null;
java.sql.Date jhzbjsj=null;
String jhzbjsjstr=null;

String khzyxz=null;



String bz=null;




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisFileData.jsp" name="editform" target="_blank">
<div align="center">导入客户信息</div>
  <table width="450%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">序号</td>
      <td width="2%">客户姓名</td>
      <td width="1%">性别</td>
	  <td width="3%">手机</td>
	  <td width="3%">其它电话</td>
	  <td width="2%">所属城区</td>
	  <td width="3%">小区</td>
	  <td width="3%">楼号</td>
	  <td width="7%">房屋地址</td>
      <td width="2%">套内建筑面积</td>
      <td width="4%">信息来源</td>
      <td width="5%">信息来源说明</td>
	  <td width="2%">是否需回访</td>
	  <td width="2%">回访日期</td>	 
	  <td width="2%">家装工装</td>	 
      <td width="2%">客户经理</td>
      <td width="2%">家居顾问</td>
      <td width="2%">设计师</td>
      <td width="2%">业务员</td>
	  <td width="3%">咨询店面</td>
	  <td width="3%">所属分公司</td>
	  <td width="2%">预计装修时间</td>
	  <td width="2%">计划出平面图时间</td>
	  <td width="2%">实出平面图时间</td>
	  <td width="2%">计划出效果图时间</td>
	  <td width="2%">实出效果图时间</td>
	  <td width="2%">计划出施工图时间</td>
	  <td width="2%">实出施工图时间</td>
	  <td width="2%">计划做电子报价时间</td>
	  <td width="2%">实做电子报价时间</td>
      <td width="2%">设计合同号</td>
	  <td width="2%">实收设计费</td>
	  <td width="2%">实际交设计费时间</td>
	  <td width="2%">实收定金</td>
	  <td width="2%">实际交定金时间</td>
	  <td width="2%">客户资源性质</td>
	  <td width="2%">录入人</td>
	  <td width="2%">录入时间</td>
	  <td width="3%">录入部门</td>
	  <td width="7%">备注</td>
	

    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	String bgcolor="";
	String row="";

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		
		row=outStr[i][0].trim();
		khxm=outStr[i][1].trim();
		xbstr=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		qtdh=outStr[i][4].trim();
		cqbmstr=outStr[i][5].trim();
		xqbm=outStr[i][6].trim();
		louhao=outStr[i][7].trim();
		fwdz=outStr[i][8].trim();
		fwmjstr=outStr[i][9].trim();
		xxlybmstr=outStr[i][10].trim();

		xxlysm=outStr[i][11].trim();
		sfxhfstr=outStr[i][12].trim();
		hfrqstr=outStr[i][13].trim();
		jzbzstr=outStr[i][14].trim();
		khjl=outStr[i][15].trim();
		clgw=outStr[i][16].trim();
		sjs=outStr[i][17].trim();
		ywy=outStr[i][18].trim();
		dwmc=outStr[i][19].trim();
		fgsmc=outStr[i][20].trim();
		yjzxsjstr=outStr[i][21].trim();

		jhctsjstr=outStr[i][22].trim();
		ctsjstr=outStr[i][23].trim();
		jhcxgtsjstr=outStr[i][24].trim();
		cxgtsjstr=outStr[i][25].trim();
		jhcsgtsjstr=outStr[i][26].trim();
		csgtsjstr=outStr[i][27].trim();
		jhzbjsjstr=outStr[i][28].trim();
		sczbjsjstr=outStr[i][29].trim();

        hth=outStr[i][30].trim();
        sjfstr=outStr[i][31].trim();
        jsjfsjstr=outStr[i][32].trim();
        lfdjstr=outStr[i][33].trim();
        jlfdjsjstr=outStr[i][34].trim();
		khzyxz=outStr[i][35].trim();
		lrr=outStr[i][36].trim();

		lrsjstr=outStr[i][37].trim();
		zxdjbmstr=outStr[i][38].trim();
		bz=outStr[i][39].trim();

		if(khxm==null||khxm.equals(""))
		{
//			out.print("<BR>提醒！序号『"+row+"』客户姓名为空，下面数据自动放弃！");
			break;
		}

		//检查『所属分公司』是否正确
		String dqbm=null;
		sql="select dwbh,dqbm";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+fgsmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=rs.getString("dwbh");
			dqbm=rs.getString("dqbm");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！所属分公司『"+fgsmc+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『咨询店面』是否正确
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where ssfgs='"+fgsbh+"' and dwmc='"+dwmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！咨询店面『"+dwmc+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『录入部门』是否正确
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+zxdjbmstr.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdjbm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！录入部门『"+zxdjbmstr+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『性别』是否正确
		if (xbstr==null || xbstr.equals(""))//M;男；W：女
		{
			out.print("<BR>序号『"+row+"』错误！『性别』不能为空！");
			return;
		}
		else if (xbstr.trim().equals("男"))
		{
			xb="M";
		}
		else if (xbstr.trim().equals("女"))
		{
			xb="W";
		}
		else{
			out.print("<BR>序号『"+row+"』错误！『性别』不正确，只能是『男、女』其中之一！");
			return;
		}

		//检查『所属城区』是否正确
		if (cqbmstr==null || cqbmstr.equals(""))
		{
			cqbm="";
		}
		else{
			sql="select cqbm";
			sql+=" from  dm_cqbm";
			sql+=" where dqbm='"+dqbm+"' and cqmc='"+cqbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cqbm=rs.getString("cqbm");
			}
			else{
				out.print("<BR>序号『"+row+"』错误！所属城区『"+cqbmstr+"』不存在！");
				return;
			}
			rs.close();
			ps.close();
		}

		//检查『房屋地址』是否正确
		if (fwdz==null || fwdz.equals(""))
		{
			out.print("<BR>序号『"+row+"』错误！『房屋地址』不能为空！");
			return;
		}


		//检查『套内建筑面积』是否正确
		if (fwmjstr==null || fwmjstr.equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！套内建筑面积『"+fwmjstr+"』不是数字类型！");
				return;
			}
		}

		//检查『信息来源』是否正确
		if (xxlybmstr==null || xxlybmstr.equals(""))
		{
			xxlybm="";
		}
		else{
			sql="select xxlybm";
			sql+=" from  dm_xxlybm";
			sql+=" where xxlymc='"+xxlybmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xxlybm=rs.getString("xxlybm");
			}
			else{
				out.print("<BR>序号『"+row+"』错误！信息来源『"+xxlybmstr+"』不存在！");
				return;
			}
			rs.close();
			ps.close();
		}

		//检查『是否需回访』是否正确
		if (sfxhfstr==null || sfxhfstr.equals(""))//Y：需回访；N：不需回访
		{
			out.print("<BR>序号『"+row+"』错误！『是否需回访』不能为空！");
			return;
		}
		else if (sfxhfstr.trim().equals("需回访"))
		{
			sfxhf="Y";

			//检查『回访日期』是否正确
			if (hfrqstr==null || hfrqstr.equals(""))
			{
				out.print("<BR>序号『"+row+"』错误！『回访日期』不能为空！");
				return;
			}
			else{
				try{
					hfrq=java.sql.Date.valueOf(hfrqstr.trim());
				}
				catch (Exception e){
					out.print("<BR>序号『"+row+"』错误！回访日期『"+hfrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
					return;
				}
			}
		}
		else if (sfxhfstr.trim().equals("不需回访"))
		{
			sfxhf="N";
			hfrqstr="";
		}
		else{
			out.print("<BR>序号『"+row+"』错误！『是否需回访』不正确，只能是『需回访、不需回访』其中之一！");
			return;
		}

		//检查『家装工装』是否正确
		if (jzbzstr==null || jzbzstr.equals(""))//1：家装；2：工装
		{
			out.print("<BR>序号『"+row+"』错误！『家装工装』不能为空！");
			return;
		}
		else if (jzbzstr.trim().equals("家装"))
		{
			jzbz="1";
		}
		else if (jzbzstr.trim().equals("工装"))
		{
			jzbz="2";
		}
		else{
			out.print("<BR>序号『"+row+"』错误！『家装工装』不正确，只能是『家装、工装』其中之一！");
			return;
		}

		int count=0;
		//检查『客户经理』是否正确
		if (khjl==null || khjl.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='03' and yhmc='"+khjl.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>序号『"+row+"』提醒！客户经理『"+khjl+"』不存在！");
//				return;
			}
		}

		//检查『家居顾问』是否正确
		if (clgw==null || clgw.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='08' and yhmc='"+clgw.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>序号『"+row+"』提醒！家居顾问『"+clgw+"』不存在！");
//				return;
			}
		}

		//检查『设计师』是否正确
		if (sjs==null || sjs.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where dwbh='"+zxdm+"' and zwbm='04' and yhmc='"+sjs.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>序号『"+row+"』提醒！设计师『"+sjs+"』不存在！");
//				return;
			}
		}

		//检查『业务员』是否正确
		if (ywy==null || ywy.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  sq_yhxx";
			sql+=" where ssfgs='"+fgsbh+"' and zwbm='19' and yhmc='"+ywy.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>序号『"+row+"』提醒！业务员『"+ywy+"』不存在！");
//				return;
			}
		}

		//检查『预计装修时间』是否正确
		if (yjzxsjstr==null || yjzxsjstr.equals(""))
		{
		}
		else{
			try{
				yjzxsj=java.sql.Date.valueOf(yjzxsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！预计装修时间『"+yjzxsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}


		//检查[计划出平面图时间]是否正确
		if (jhctsjstr==null || jhctsjstr.equals(""))
		{
		}
		else{
			try{
				jhctsj=java.sql.Date.valueOf(jhctsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！计划出平面图时间『"+jhctsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查[实出平面图时间]是否正确
		if (ctsjstr==null || ctsjstr.equals(""))
		{
		}
		else{
			try{
				ctsj=java.sql.Date.valueOf(ctsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实出平面图时间『"+ctsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查[计划出效果图时间]是否正确
		if (jhcxgtsjstr==null || jhcxgtsjstr.equals(""))
		{
		}
		else{
			try{
				jhcxgtsj=java.sql.Date.valueOf(jhcxgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！计划出效果图时间『"+jhcxgtsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查[实出效果图时间]是否正确
		if (cxgtsjstr==null || cxgtsjstr.equals(""))
		{
		}
		else{
			try{
				cxgtsj=java.sql.Date.valueOf(cxgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实出效果图时间『"+cxgtsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查[计划出施工图时间]是否正确
		if (jhcsgtsjstr==null || jhcsgtsjstr.equals(""))
		{
		}
		else{
			try{
				jhcsgtsj=java.sql.Date.valueOf(jhcsgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！计划出施工图时间『"+jhcsgtsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查[实出施工图时间]是否正确
		if (csgtsjstr==null || csgtsjstr.equals(""))
		{
		}
		else{
			try{
				csgtsj=java.sql.Date.valueOf(csgtsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实出施工图时间『"+csgtsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查[计划做电子报价时间]是否正确
		if (jhzbjsjstr==null || jhzbjsjstr.equals(""))
		{
		}
		else{
			try{
				jhzbjsj=java.sql.Date.valueOf(jhzbjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！计划做电子报价时间『"+jhzbjsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查[实做电子报价时间]是否正确
		if (sczbjsjstr==null || sczbjsjstr.equals(""))
		{
		}
		else{
			try{
				sczbjsj=java.sql.Date.valueOf(sczbjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实做电子报价时间『"+sczbjsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『设计合同金额』是否正确
		if (sjfstr==null || sjfstr.equals(""))
		{
			sjf=0;
		}
		else{
			try{
				sjf=(int)Double.parseDouble(sjfstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！设计合同金额『"+sjfstr+"』不是数字类型！");
				return;
			}
		}

		//检查『实际交设计费时间』是否正确
		if (jsjfsjstr==null || jsjfsjstr.equals(""))
		{
		}
		else{
			try{
				jsjfsj=java.sql.Date.valueOf(jsjfsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实际交设计费时间『"+jsjfsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『定金金额』是否正确
		if (lfdjstr==null || lfdjstr.equals(""))
		{
			lfdj=0;
		}
		else{
			try{
				lfdj=(int)Double.parseDouble(lfdjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！定金金额『"+lfdjstr+"』不是数字类型！");
				return;
			}
		}

		//检查『实际交定金时间』是否正确
		if (jlfdjsjstr==null || jlfdjsjstr.equals(""))
		{
		}
		else{
			try{
				jlfdjsj=java.sql.Date.valueOf(jlfdjsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实际交定金时间『"+jlfdjsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『客户资源性质』是否正确
		if (khzyxz==null || khzyxz.equals(""))
		{
		}
		else{
			sql="select count(*)";
			sql+=" from  dm_khzyxzbm";
			sql+=" where khzyxz='"+khzyxz+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.print("<BR>序号『"+row+"』错误！客户资源性质『"+khzyxz+"』不存在！");
				return;
			}
		}

		//检查『录入人』是否正确
		if (lrr==null || lrr.equals(""))
		{
			out.print("<BR>序号『"+row+"』错误！『录入人』不能为空！");
			return;
		}

		//检查『录入时间』是否正确
		if (lrsjstr==null || lrsjstr.equals(""))
		{
			out.print("<BR>序号『"+row+"』错误！『录入时间』不能为空！");
			return;
		}
		else{
			try{
				lrsj=java.sql.Date.valueOf(lrsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！录入时间『"+lrsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="row" type="hidden" value="<%=row%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=xbstr%> 
        <input name="xb" type="hidden" value="<%=xb.trim()%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
      <td><%=qtdh%>
        <input name="qtdh" type="hidden" value="<%=qtdh%>" >
      </td>
	  <td><%=cqbmstr%>
        <input name="cqbm" type="hidden" value="<%=cqbm%>" >
      </td>
	  <td><%=xqbm%>
        <input name="xqbm" type="hidden" value="<%=xqbm%>" >
      </td>
	  <td><%=louhao%>
        <input name="louhao" type="hidden" value="<%=louhao%>" >
      </td>
	  <td><%=fwdz%>
        <input name="fwdz" type="hidden" value="<%=fwdz%>" >
      </td>
      <td><%=fwmj%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>" >
      </td>
      <td><%=xxlybmstr%>
        <input name="xxlybm" type="hidden" value="<%=xxlybm%>" >
      </td>
      <td><%=xxlysm%>
        <input name="xxlysm" type="hidden" value="<%=xxlysm%>" >
      </td>
 	  <td > <%=sfxhfstr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td > <%=hfrqstr%>
        <input name="hfrq" type="hidden" value="<%=hfrqstr.trim()%>" >
      </td>
	  <td > <%=jzbzstr%>
        <input name="jzbz" type="hidden" value="<%=jzbz%>" >
      </td>
      <td><%=khjl%>
        <input name="khjl" type="hidden" value="<%=khjl%>" >
      </td>
	  <td><%=clgw%>
        <input name="clgw" type="hidden" value="<%=clgw%>" >
      </td>
      <td><%=sjs%>
        <input name="sjs" type="hidden" value="<%=sjs%>" >
      </td>
	   <td > <%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=dwmc%>
        <input name="zxdm" type="hidden" value="<%=zxdm%>" >
      </td>
	  <td><%=fgsmc%>
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>" >
      </td> 
	  <td><%=yjzxsjstr%>
        <input name="yjzxsj" type="hidden" value="<%=yjzxsjstr%>" >
      </td> 

	  <td><%=jhctsjstr%>
        <input name="jhctsj" type="hidden" value="<%=jhctsjstr%>" >
      </td> 
	  <td><%=ctsjstr%>
        <input name="ctsj" type="hidden" value="<%=ctsjstr%>" >
      </td> 
	  <td><%=jhcxgtsjstr%>
        <input name="jhcxgtsj" type="hidden" value="<%=jhcxgtsjstr%>" >
      </td> 
	  <td><%=cxgtsjstr%>
        <input name="cxgtsj" type="hidden" value="<%=cxgtsjstr%>" >
      </td> 
	  <td><%=jhcsgtsjstr%>
        <input name="jhcsgtsj" type="hidden" value="<%=jhcsgtsjstr%>" >
      </td> 
	  <td><%=csgtsjstr%>
        <input name="csgtsj" type="hidden" value="<%=csgtsjstr%>" >
      </td> 
	  <td><%=jhzbjsjstr%>
        <input name="jhzbjsj" type="hidden" value="<%=jhzbjsjstr%>" >
      </td> 
	  <td><%=sczbjsjstr%>
        <input name="sczbjsj" type="hidden" value="<%=sczbjsjstr%>" >
      </td> 

	  <td><%=hth%>
        <input name="hth" type="hidden" value="<%=hth%>" >
      </td> 
      <td><%=sjf%>
        <input name="sjf" type="hidden" value="<%=sjf%>" >
      </td> 
	  <td><%=jsjfsjstr%>
        <input name="jsjfsj" type="hidden" value="<%=jsjfsjstr%>" >
      </td> 
	  <td><%=lfdj%>
        <input name="lfdj" type="hidden" value="<%=lfdj%>" >
      </td> 
	  <td><%=jlfdjsjstr%>
        <input name="jlfdjsj" type="hidden" value="<%=jlfdjsjstr%>" >
      </td> 


	  <td><%=khzyxz%>
        <input name="khzyxz" type="hidden" value="<%=khzyxz%>" >
      </td> 


	  <td><%=lrr%>
        <input name="lrr" type="hidden" value="<%=lrr%>" >
      </td> 
	  <td><%=lrsjstr%>
        <input name="lrsj" type="hidden" value="<%=lrsjstr%>" >
      </td> 
	  <td><%=zxdjbmstr%>
        <input name="zxdjbm" type="hidden" value="<%=zxdjbm%>" >
      </td> 
	  <td><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td> 
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (f != null) f.close(); 
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
        <input type="button"  value="存盘" onClick="f_do(editform)">
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
	return true;
}
//-->
</SCRIPT>
