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
String cqbm=null;
String cqmc=null;
String xqbm=null;
String louhao=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String hth=null;
String khjl=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String mgfrz=null;
String nwgfrz=null;
String sdgfrz=null;
String yqgfrz=null;

String wdzgcestr=null;
double wdzgce=0;
String qyestr=null;
double qye=0;
String qyrqstr=null;
java.sql.Date qyrq=null;
String kgrqstr=null;
java.sql.Date kgrq=null;
String jgrqstr=null;
java.sql.Date jgrq=null;
String dwmc=null;
String dwbh=null;
String fgsmc=null;
String fgsbh=null;
String gcjdbm=null;
String bz=null;

String khlxbm=null;
String khlxbmstr=null;
String hxbm=null;
String hxbmstr=null;
String ysbm=null;
String ysbmstr=null;
int fwmj=0;
String fwmjstr=null;
String sfyyh=null;
String yhyy=null;
java.sql.Date sjkgrq=null;
String sjkgrqstr=null;
java.sql.Date sjjgrq=null;
String sjjgrqstr=null;
java.sql.Date bxjzsj=null;
String bxjzsjstr=null;
String kbxbz=null;

String xxlybm=null;
String xxlybmstr=null;
String xxlysm=null;


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
<form method="post" action="SavekhxxLoadData.jsp" name="editform" target="_blank">

<div align="center">导入客户信息</div>
  <table width="450%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">序号</td>
      <td width="3%">合同号</td>
      <td width="2%">客户姓名</td>
	  <td width="3%">联系方式</td>
	  <td width="3%">其它电话</td>
	  <td width="2%">所属城区</td>
	  <td width="3%">小区</td>
	  <td width="2%">楼号</td>
	  <td width="6%">房屋地址</td>
      <td width="2%">客户经理</td>
      <td width="2%">设计师</td>
	  <td width="2%">工程担当</td>
	  <td width="2%">施工队</td>	 
	  <td width="2%">班长</td>	 
	  <td width="2%">木工负责人</td>	 
	  <td width="2%">泥瓦工负责人</td>	 
	  <td width="2%">水电工负责人</td>	 
	  <td width="2%">油漆工负责人</td>	 

	  <td width="3%">关系客户</td>	 
	  <td width="3%">户型</td>	 
	  <td width="2%">油色</td>	 
	  <td width="2%">房屋面积</td>	 
	  <td width="7%">优惠内容</td>	 

	  <td width="3%">工程原报价</td> 
	  <td width="3%">工程签约额</td> 
	  <td width="2%">签约日期</td>
	  <td width="2%">合同开工日期</td>
	  <td width="2%">合同竣工日期</td>

	  <td width="2%">实际开工日期</td>
	  <td width="2%">实际竣工日期</td>
	  <td width="2%">保修截止时间</td>

	  <td width="4%">信息来源</td>
	  <td width="5%">信息来源说明</td>
	  <td width="4%">签约店面</td>
	  <td width="3%">所属分公司</td>
	  <td width="37%">备注</td>
	

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
		hth=outStr[i][1].trim();
		khxm=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		qtdh=outStr[i][4].trim();
		cqmc=outStr[i][5].trim();
		xqbm=outStr[i][6].trim();
		louhao=outStr[i][7].trim();
		fwdz=outStr[i][8].trim();
		khjl=outStr[i][9].trim();

		sjs=outStr[i][10].trim();
		zjxm=outStr[i][11].trim();
		sgdmc=outStr[i][12].trim();
		sgbz=outStr[i][13].trim();
		mgfrz=outStr[i][14].trim();
		nwgfrz=outStr[i][15].trim();
		sdgfrz=outStr[i][16].trim();
		yqgfrz=outStr[i][17].trim();
		khlxbmstr=outStr[i][18].trim();
		hxbmstr=outStr[i][19].trim();
		ysbmstr=outStr[i][20].trim();

		fwmjstr=outStr[i][21].trim();
		yhyy=outStr[i][22].trim();
		wdzgcestr=outStr[i][23].trim();
		qyestr=outStr[i][24].trim();
		qyrqstr=outStr[i][25].trim();
		kgrqstr=outStr[i][26].trim();
		jgrqstr=outStr[i][27].trim();
		sjkgrqstr=outStr[i][28].trim();
		sjjgrqstr=outStr[i][29].trim();
		bxjzsjstr=outStr[i][30].trim();

		xxlybmstr=outStr[i][31].trim();
		xxlysm=outStr[i][32].trim();
		dwmc=outStr[i][33].trim();
		fgsmc=outStr[i][34].trim();
		bz=outStr[i][35].trim();


		if(khxm==null||khxm.equals(""))
		{
			out.print("<BR>序号『"+row+"』，客户姓名为空，下面数据自动放弃");
			break;
		}

		if(fwdz==null||fwdz.equals(""))
		{
			fwdz="未知";
		}

		//检查『工程原报价』是否正确
		if (wdzgcestr==null || wdzgcestr.equals(""))
		{
			wdzgce=0;
		}
		else{
			try{
				wdzgce=Double.parseDouble(wdzgcestr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！工程原报价『"+wdzgcestr+"』不是数字类型！");
				return;
			}
		}

		//检查『工程签约额』是否正确
		if (qyestr==null || qyestr.equals(""))
		{
			qye=0;
		}
		else{
			try{
				qye=Double.parseDouble(qyestr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！工程签约额『"+qyestr+"』不是数字类型！");
				return;
			}
		}

		//检查『签约日期』是否正确
		if (qyrqstr==null || qyrqstr.equals(""))
		{
			qyrq=null;
		}
		else{
			try{
				qyrq=java.sql.Date.valueOf(qyrqstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！签约日期『"+qyrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『合同开工日期』是否正确
		if (kgrqstr==null || kgrqstr.equals(""))
		{
			kgrq=null;
		}
		else{
			try{
				kgrq=java.sql.Date.valueOf(kgrqstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！合同开工日期『"+kgrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『合同竣工日期』是否正确
		if (jgrqstr==null || jgrqstr.equals(""))
		{
			jgrq=null;
		}
		else{
			try{
				jgrq=java.sql.Date.valueOf(jgrqstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！合同竣工日期『"+jgrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
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

		//检查『签约店面』是否正确
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where ssfgs='"+fgsbh+"' and dwmc='"+dwmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！签约店面『"+dwmc+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『所属城区』是否正确
		sql="select cqbm";
		sql+=" from  dm_cqbm";
		sql+=" where dqbm='"+dqbm+"' and cqmc='"+cqmc.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cqbm=rs.getString("cqbm");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！所属城区『"+cqmc+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『施工队』是否正确
		if (sgdmc==null || sgdmc.equals(""))
		{
			sgd="";
		}
		else{
			sql="select sgd";
			sql+=" from  sq_sgd";
			sql+=" where ssfgs='"+fgsbh+"' and sgdmc='"+sgdmc.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sgd=rs.getString("sgd");
			}
			else{
				out.print("<P>序号『"+row+"』提醒！施工队『"+sgdmc+"』不存在！");
			}
			rs.close();
			ps.close();
		}


		//检查『关系客户』是否正确
		if (khlxbmstr==null || khlxbmstr.equals(""))
		{
			out.print("<BR>序号『"+row+"』错误！[关系客户]不能为空！");
			return;
		}
		else{
			sql="select khlxbm";
			sql+=" from  dm_khlxbm";
			sql+=" where khlxmc='"+khlxbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khlxbm=rs.getString("khlxbm");
			}
			else{
				out.print("<BR>序号『"+row+"』错误！关系客户『"+khlxbmstr+"』不存在！");
				return;
			}
			rs.close();
			ps.close();
		}
		//检查『户型』是否正确
		if (hxbmstr==null || hxbmstr.equals(""))
		{
			hxbm="";
		}
		else{
			sql="select hxbm";
			sql+=" from  dm_hxbm";
			sql+=" where hxmc='"+hxbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				hxbm=rs.getString("hxbm");
			}
			else{
				out.print("<BR>序号『"+row+"』错误！户型『"+hxbmstr+"』不存在！");
				return;
			}
			rs.close();
			ps.close();
		}
		//检查『油色』是否正确
		if (ysbmstr==null || ysbmstr.equals(""))
		{
			ysbm="";
		}
		else{
			sql="select ysbm";
			sql+=" from  dm_ysbm";
			sql+=" where ysmc='"+ysbmstr.trim()+"'";
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ysbm=rs.getString("ysbm");
			}
			else{
				out.print("<BR>序号『"+row+"』错误！油色『"+ysbmstr+"』不存在！");
				return;
			}
			rs.close();
			ps.close();
		}

		//检查『房屋面积』是否正确
		if (fwmjstr==null || fwmjstr.equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！房屋面积『"+fwmjstr+"』不是数字类型！");
				return;
			}
		}

		if (yhyy.equals(""))
		{
			sfyyh="N";
		}
		else{
			sfyyh="Y";
		}

		//检查『实际开工日期』是否正确
		if (sjkgrqstr==null || sjkgrqstr.equals(""))
		{
			sjkgrq=null;
		}
		else{
			try{
				sjkgrq=java.sql.Date.valueOf(sjkgrqstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实际开工日期『"+sjkgrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『实际竣工日期』是否正确
		if (sjjgrqstr==null || sjjgrqstr.equals(""))
		{
			sjjgrq=null;
		}
		else{
			try{
				sjjgrq=java.sql.Date.valueOf(sjjgrqstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！实际竣工日期『"+sjjgrqstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『保修截止时间』是否正确
		if (bxjzsjstr==null || bxjzsjstr.equals(""))
		{
			bxjzsj=null;
		}
		else{
			try{
				bxjzsj=java.sql.Date.valueOf(bxjzsjstr.trim());
			}
			catch (Exception e){
				out.print("<BR>序号『"+row+"』错误！保修截止时间『"+bxjzsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		kbxbz="N";
		if (!bxjzsjstr.equals(""))
		{
			gcjdbm="5";
			kbxbz="Y";
		}
		else if (!sjjgrqstr.equals(""))
		{
			gcjdbm="4";
		}
		else if (!sjkgrqstr.equals(""))
		{
			gcjdbm="2";
		}
		else{
			gcjdbm="1";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="row" type="hidden" value="<%=row%>">
      </td>
      <td><%=hth%> 
        <input name="hth" type="hidden" value="<%=hth.trim()%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
      <td><%=qtdh%>
        <input name="qtdh" type="hidden" value="<%=qtdh%>" >
      </td>
	  <td><%=cqmc%>
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
      <td><%=khjl%>
        <input name="khjl" type="hidden" value="<%=khjl%>" >
      </td>
      <td><%=sjs%>
        <input name="sjs" type="hidden" value="<%=sjs%>" >
      </td>
      <td><%=zjxm%>
        <input name="zjxm" type="hidden" value="<%=zjxm%>" >
      </td>
      <td><%=sgdmc%>
        <input name="sgdxm" type="hidden" value="<%=sgdmc%>" >
        <input name="sgd" type="hidden" value="<%=sgd%>" >
      </td>
      <td><%=sgbz%>
        <input name="sgbz" type="hidden" value="<%=sgbz%>" >
      </td>
      <td><%=mgfrz%>
        <input name="mgfrz" type="hidden" value="<%=mgfrz%>" >
      </td>
      <td><%=nwgfrz%>
        <input name="nwgfrz" type="hidden" value="<%=nwgfrz%>" >
      </td>
      <td><%=sdgfrz%>
        <input name="sdgfrz" type="hidden" value="<%=sdgfrz%>" >
      </td>
      <td><%=yqgfrz%>
        <input name="yqgfrz" type="hidden" value="<%=yqgfrz%>" >
      </td>

	  
      <td><%=khlxbmstr%>
        <input name="khlxbm" type="hidden" value="<%=khlxbm%>" >
      </td>
      <td><%=hxbmstr%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>" >
      </td>
      <td><%=ysbmstr%>
        <input name="ysbm" type="hidden" value="<%=ysbm%>" >
      </td>
      <td><%=fwmjstr%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>" >
      </td>
      <td><%=yhyy%>
        <input name="sfyyh" type="hidden" value="<%=sfyyh%>" >
        <input name="yhyy" type="hidden" value="<%=yhyy%>" >
      </td>
  
	  
	  <td><%=wdzgce%>
        <input name="wdzgce" type="hidden" value="<%=wdzgce%>" >
      </td>
	  <td><%=qye%>
        <input name="qye" type="hidden" value="<%=qye%>" >
      </td>
	   <td > <%=qyrqstr%>
        <input name="qyrq" type="hidden" value="<%=qyrqstr%>" >
      </td>
	   <td > <%=kgrqstr%>
        <input name="kgrq" type="hidden" value="<%=kgrqstr%>" >
      </td>
	   <td > <%=jgrqstr%>
        <input name="jgrq" type="hidden" value="<%=jgrqstr%>" >
      </td>

	   <td > <%=sjkgrqstr%>
        <input name="sjkgrq" type="hidden" value="<%=sjkgrqstr%>" >
      </td>
	   <td > <%=sjjgrqstr%>
        <input name="sjjgrq" type="hidden" value="<%=sjjgrqstr%>" >
      </td>
	   <td > <%=bxjzsjstr%>
        <input name="kbxbz" type="hidden" value="<%=kbxbz%>" >
        <input name="bxjzsj" type="hidden" value="<%=bxjzsjstr%>" >
      </td>

      <td><%=xxlybmstr%>
        <input name="xxlybm" type="hidden" value="<%=xxlybm%>" >
      </td>
      <td><%=xxlysm%>
        <input name="xxlysm" type="hidden" value="<%=xxlysm%>" >
      </td>
	   <td><%=dwmc%>
        <input name="dwbh" type="hidden" value="<%=dwbh%>" >
      </td>
	   <td><%=fgsmc%>
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>" >
      </td> 
	  <td><%=bz%>
        <input name="gcjdbm" type="hidden" value="<%=gcjdbm%>" >
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
