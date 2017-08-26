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
java.sql.Date xchfsj=null;
String xchfsjstr=null;
String jzbz=null;
String jzbzstr=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;
String zxdm=null;
String fgsmc=null;
String fgsbh=null;

java.sql.Date yjzxsj=null;
String yjzxsjstr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrsjstr=null;
String lrbm=null;
String lrbmstr=null;


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
<form method="post" action="SaveDisData.jsp" name="editform" target="_blank">
<div align="center">导入客户信息</div>
  <table width="300%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="1%">序号</td>
      <td width="2%">客户姓名</td>
      <td width="1%">性别</td>
	  <td width="6%">联系方式</td>
	  <td width="6%">其它电话</td>
	  <td width="2%">所属城区</td>
	  <td width="3%">小区</td>
	  <td width="3%">楼号</td>
	  <td width="7%">房屋地址</td>
      <td width="2%">套内建筑面积</td>
	  <td width="2%">是否需回访</td>
	  <td width="2%">回访日期</td>	 
      <td width="2%">业务员</td>
	  <td width="3%">所属分公司</td>
	  <td width="2%">预计装修时间</td>
	  <td width="2%">客户资源性质</td>
	  <td width="2%">录入人</td>
	  <td width="2%">录入时间</td>
	  <td width="3%">录入部门</td>
	  <td width="9%">备注</td>
	

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
		sfxhfstr=outStr[i][10].trim();
		xchfsjstr=outStr[i][11].trim();
		ywy=outStr[i][12].trim();
		fgsmc=outStr[i][13].trim();
		yjzxsjstr=outStr[i][14].trim();
		khzyxz=outStr[i][15].trim();
		lrr=outStr[i][16].trim();

		lrsjstr=outStr[i][17].trim();
		lrbmstr=outStr[i][18].trim();
		bz=outStr[i][19].trim();

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


		//检查『录入部门』是否正确
		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+lrbmstr.trim()+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lrbm=rs.getString("dwbh");
		}
		else{
			out.print("<BR>序号『"+row+"』错误！录入部门『"+lrbmstr+"』不存在！");
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
			if (xchfsjstr==null || xchfsjstr.equals(""))
			{
				out.print("<BR>序号『"+row+"』错误！『回访日期』不能为空！");
				return;
			}
			else{
				try{
					xchfsj=java.sql.Date.valueOf(xchfsjstr.trim());
				}
				catch (Exception e){
					out.print("<BR>序号『"+row+"』错误！回访日期『"+xchfsjstr+"』不是日期类型格式『YYYY-MM-DD』！");
					return;
				}
			}
		}
		else if (sfxhfstr.trim().equals("不需回访"))
		{
			sfxhf="N";
			xchfsjstr="";
		}
		else{
			out.print("<BR>序号『"+row+"』错误！『是否需回访』不正确，只能是『需回访、不需回访』其中之一！");
			return;
		}


		int count=0;
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
 	  <td > <%=sfxhfstr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td > <%=xchfsjstr%>
        <input name="xchfsj" type="hidden" value="<%=xchfsjstr.trim()%>" >
      </td>
	   <td > <%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=fgsmc%>
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>" >
      </td> 
	  <td><%=yjzxsjstr%>
        <input name="yjzxsj" type="hidden" value="<%=yjzxsjstr%>" >
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
	  <td><%=lrbmstr%>
        <input name="lrbm" type="hidden" value="<%=lrbm%>" >
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
