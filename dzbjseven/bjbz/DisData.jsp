<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String bjbbh = null;
String bjjbbm = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;
String jzbzmc=null;

String[][] outStr=null; 
String bgcolor=null;
String xmdlbm=null;
String xmxlbm=null;
String xmflbm=null;
String xmbh=null;
String xmmc=null;
String sfbxxstr=null;
String sfbxx=null;
String smbm=null;
String jldwbm=null;
String bjStr=null;
String clbjStr=null;
String rgbjStr=null;
String jxbjStr=null;
String sgdbjStr=null;
String mark=null;
String gycl=null;
String flmcgg=null;
String bz=null;
String glxmbh=null;
String xh=null;
String sfxycl=null;
String sfxyclstr=null;
String sfxyyjd=null;
String sfxyyjdstr=null;

double oldbj=0;
double bj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
double sgdbj=0;

double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
String zcfStr=null;
String shfStr=null;
String ysfStr=null;
String qtfStr=null;

String sgcbjStr=null;
String sfyxdzStr=null;
String sfyxdz=null;
String zdzkStr=null;
double sgcbj=0;
double zdzk=0;
double cbenj=0;

String cbenjStr=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	bjjbbm =up.getParameter("bjjbbm");
	dqbm =up.getParameter("dqbm");
	bjbbh =up.getParameter("bjbbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select bjjbmc" ;
	sql+=" from bdm_bjjbbm " ;
	sql+=" where bjjbbm='"+bjjbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		bjjbmc = rs.getString("bjjbmc");			    
	}
	else{
		out.println("错误！报价级别不存在");
		return;
	}
	rs.close();
	ps.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入电子报价 </p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]；</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>若项目已存在，则进行替换，否则进行增加</b></font></p>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
  <table width="310%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">项目大类</td>
      <td width="3%">项目小类</td>
      <td width="3%">项目分类</td>
	  <td width="3%"><font color="#CC0000">项目编号*</font></td>
      <td width="7%">项目名称</td>
      <td width="2%">是否必选</td>
      <td width="3%">饰面</td>
      <td width="2%">计量单位</td>
	  <td width="3%"><font color="#CC0000">成本价*</font></td>
	  <td width="3%"><font color="#CC0000">施工成本价*</font></td>
	  <td width="3%"><font color="#CC0000">工程预算价*</font></td>

	<td width="3%"><font color="#CC0000">辅材费*</font></td>
	<td width="3%"><font color="#CC0000">主材费*</font></td>
	<td width="3%"><font color="#CC0000">人工费*</font></td>
	<td width="3%"><font color="#CC0000">运输费*</font></td>
	<td width="3%"><font color="#CC0000">机械费*</font></td>
	<td width="2%"><font color="#CC0000">损耗费*</font></td>
	<td width="2%"><font color="#CC0000">其它费*</font></td>
	<td width="3%"><font color="#CC0000">工程基础报价*</font></td>
	<td width="2%"><font color="#CC0000">是否允许打折*</font></td>
	<td width="2%"><font color="#CC0000">最低折扣*</font></td>
	
	
      <td width="16%"><font color="#CC0000">工艺做法及材料说明*</font></td>
      <td width="9%">辅料名称规格</td>
      <td width="7%">备注</td>
      <td width="5%">关联项目编号</td>
      <td width="1%">排序序号</td>
      <td width="2%">是否需要材料</td>
      <td width="2%">是否需预交底</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbhStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<23)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		xmdlbm=outStr[i][0].trim();
		xmxlbm=outStr[i][1].trim();
		xmflbm=outStr[i][2].trim();
		xmbh=outStr[i][3].trim();

		xmbhStr[i-1]=xmbh;

		xmmc=outStr[i][4].trim();
		sfbxxstr=outStr[i][5].trim();
		smbm=outStr[i][6].trim();
		jldwbm=outStr[i][7].trim();
		cbenjStr=outStr[i][8].trim();
		sgcbjStr=outStr[i][9].trim();
		bjStr=outStr[i][10].trim();
		clbjStr=outStr[i][11].trim();
		zcfStr=outStr[i][12].trim();

		rgbjStr=outStr[i][13].trim();
		ysfStr=outStr[i][14].trim();
		jxbjStr=outStr[i][15].trim();
		shfStr=outStr[i][16].trim();
		qtfStr=outStr[i][17].trim();
		sgdbjStr=outStr[i][18].trim();
		sfyxdzStr=outStr[i][19].trim();
		zdzkStr=outStr[i][20].trim();

		gycl=outStr[i][21].trim();
		flmcgg=outStr[i][22].trim();
		//bz=outStr[i][22].trim();
		bz=outStr[i][23].trim();
		glxmbh=outStr[i][24].trim();
		xh=outStr[i][25].trim();
		sfxyclstr=outStr[i][26].trim();
		sfxyyjdstr=outStr[i][27].trim();


		mark="";

		if (xmbh.equals(""))
		{
			out.println("！！！行号["+row+"]错误，项目编号为空");
			return;
		}



		sql=" select xmdlbm" ;
		sql+=" from bdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，不存在的[项目大类]："+xmdlbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from bdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlbm+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，不存在的[项目小类]："+xmxlbm);
			return;
		}
		rs.close();
		ps.close();

		if (!xmflbm.equals(""))
		{
			sql=" select xmflbm" ;
			sql+=" from bdm_xmflbm " ;
			sql+=" where xmflmc='"+xmflbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				xmflbm = rs.getString("xmflbm");			    
			}
			else{
				out.println("！！！项目编号["+xmbh+"]错误，不存在的[项目分类]："+xmflbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (!smbm.equals(""))
		{
			sql=" select smbm" ;
			sql+=" from bdm_smbm " ;
			sql+=" where smmc='"+smbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				smbm = rs.getString("smbm");			    
			}
			else{
				out.println("！！！项目编号["+xmbh+"]错误，不存在的[饰面]："+smbm);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwbm.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("jldwbm");			    
			}
			else{
				out.println("！！！项目编号["+xmbh+"]错误，不存在的[计量单位]："+jldwbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (bjStr.equals(""))
		{
			bj=0;
		}
		else{
			try{
				bj=Double.parseDouble(bjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！错误，[工程预算价:"+bjStr+"]不是数字:"+e);
				return;
			}
		}
		if (bj==0)
		{
			out.println("<P>提醒，项目编号["+xmbh+"][工程预算价]为0");
		}

		if (clbjStr.equals(""))
		{
			clbj=0;
		}
		else{
			try{
				clbj=Double.parseDouble(clbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[辅材费:"+clbjStr+"]不是数字:"+e);
				return;
			}
		}

		if (rgbjStr.equals(""))
		{
			rgbj=0;
		}
		else{
			try{
				rgbj=Double.parseDouble(rgbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[人工费:"+rgbjStr+"]不是数字:"+e);
				return;
			}
		}

		if (jxbjStr.equals(""))
		{
			jxbj=0;
		}
		else{
			try{
				jxbj=Double.parseDouble(jxbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[机械费:"+jxbjStr+"]不是数字:"+e);
				return;
			}
		}
		if (zcfStr.equals(""))
		{
			zcf=0;
		}
		else{
			try{
				zcf=Double.parseDouble(zcfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[主材费:"+zcfStr+"]不是数字:"+e);
				return;
			}
		}
		if (shfStr.equals(""))
		{
			shf=0;
		}
		else{
			try{
				shf=Double.parseDouble(shfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[损耗费:"+shfStr+"]不是数字:"+e);
				return;
			}
		}
		if (ysfStr.equals(""))
		{
			ysf=0;
		}
		else{
			try{
				ysf=Double.parseDouble(ysfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[运输费:"+ysfStr+"]不是数字:"+e);
				return;
			}
		}
		if (qtfStr.equals(""))
		{
			qtf=0;
		}
		else{
			try{
				qtf=Double.parseDouble(qtfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[其它费:"+qtfStr+"]不是数字:"+e);
				return;
			}
		}

		if (sgdbjStr.equals(""))
		{
			sgdbj=0;
		}
		else{
			try{
				sgdbj=Double.parseDouble(sgdbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[工程基础报价:"+sgdbjStr+"]不是数字:"+e);
				return;
			}
		}

		if (cf.round(clbj+rgbj+jxbj+zcf+shf+ysf+qtf,2)!=0)//启用：辅材费、人工费、机械费,需检查
		{
			if (bj!=cf.round(clbj+rgbj+jxbj+zcf+shf+ysf+qtf,2))
			{
				out.println("<P>！！！错误，项目编号["+xmbh+"][工程预算价："+bj+"]不等于(辅材费+主材费+人工费+运输费+机械费+损耗费+其它费:"+cf.round(clbj+rgbj+jxbj+zcf+shf+ysf+qtf,2)+")");
				return;
			}
		}

		oldbj=0;
		String oldbjStr="";
		sql=" select bj" ;
		sql+=" from bj_jzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getDouble("bj");

			if (oldbj!=bj)
			{
				oldbjStr="<BR><font color=\"#FF0000\">（原"+oldbj+"）</font>";
			}
			else{
				oldbjStr="";
			}

			mark="<BR><font color=\"#FF0000\">（已存在）</font>";
		}
		rs.close();
		ps.close();

		if (!xh.equals(""))
		{
			Double.parseDouble(xh);
		}

		if (sfbxxstr.equals("必报项"))
		{
			sfbxxstr="<font color=\"#FF0000\">"+sfbxxstr+"</font>";
			sfbxx="1";
		}
		else if (sfbxxstr.equals("必列项"))
		{
			sfbxxstr="<font color=\"#CC00CC\">"+sfbxxstr+"</font>";
			sfbxx="2";
		}
		else if (sfbxxstr.equals("可选项"))
		{
			sfbxx="3";
		}
		else if (sfbxxstr.equals("作废项"))
		{
			sfbxxstr="<font color=\"#0000FF\">"+sfbxxstr+"</font>";
			sfbxx="9";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否必选项]只能为【必报项、必列项、可选项、作废项】，目前为["+sfbxxstr+"]");
			return;
		}

		if (sfxyclstr.equals(""))
		{
			sfxycl="N";
		}
		else if (sfxyclstr.equals("需要"))
		{
			sfxycl="Y";
		}
		else if (sfxyclstr.equals("否"))
		{
			sfxycl="N";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否需要材料]只能为【需要、否】，目前为["+sfxyclstr+"]");
			return;
		}

		if (sfxyyjdstr.equals(""))
		{
			sfxyyjd="N";
		}
		else if (sfxyyjdstr.equals("需要"))
		{
			sfxyyjd="Y";
		}
		else if (sfxyyjdstr.equals("否"))
		{
			sfxyyjd="N";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否需预交底]只能为【需要、否】，目前为["+sfxyyjdstr+"]");
			return;
		}

		if (sfyxdzStr.equals("允许"))
		{
			sfyxdz="Y";
		}
		else if (sfyxdzStr.equals("否"))
		{
			sfyxdz="N";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否允许打折]只能为【允许、否】，目前为["+sfyxdzStr+"]");
			return;
		}

		if (sgcbjStr.equals(""))
		{
			sgcbj=0;
		}
		else{
			try{
				sgcbj=Double.parseDouble(sgcbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[施工成本价:"+sgcbjStr+"]不是数字:"+e);
				return;
			}
		}

		if (cbenjStr.equals(""))
		{
			cbenj=0;
		}
		else{
			try{
				cbenj=Double.parseDouble(cbenjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[成本价:"+cbenjStr+"]不是数字:"+e);
				return;
			}
		}

		if (zdzkStr.equals(""))
		{
			zdzk=0;
		}
		else{
			try{
				zdzk=Double.parseDouble(zdzkStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[最低折扣:"+zdzkStr+"]不是数字:"+e);
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=outStr[i][0]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][1]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td><%=outStr[i][2]%> 
        <input name="xmflbm" type="hidden" value="<%=xmflbm%>">
      </td>
      <td> <%=xmbh%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=sfbxxstr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
      <td> <%=outStr[i][7]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
        <td> <%=cbenj%>
        <input name="cbenj" type="hidden" value="<%=cbenj%>" >
      </td>
        <td> <%=sgcbj%>
        <input name="sgcbj" type="hidden" value="<%=sgcbj%>" >
      </td>
    <td> <%=bj%><%=oldbjStr%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
      <td> <%=clbj%>
        <input name="clbj" type="hidden" value="<%=clbj%>" >
      </td>
      <td> <%=zcf%>
        <input name="zcf" type="hidden" value="<%=zcf%>" >
      </td>
      <td> <%=rgbj%>
        <input name="rgbj" type="hidden" value="<%=rgbj%>" >
      </td>
      <td> <%=ysf%>
        <input name="ysf" type="hidden" value="<%=ysf%>" >
      </td>
      <td> <%=jxbj%>
        <input name="jxbj" type="hidden" value="<%=jxbj%>" >
      </td>
      <td> <%=shf%>
        <input name="shf" type="hidden" value="<%=shf%>" >
      </td>
      <td> <%=qtf%>
        <input name="qtf" type="hidden" value="<%=qtf%>" >
      </td>
      <td> <%=sgdbj%>
        <input name="sgdbj" type="hidden" value="<%=sgdbj%>" >
      </td>
      <td> <%=sfyxdzStr%>
        <input name="sfyxdz" type="hidden" value="<%=sfyxdz%>" >
      </td>
      <td> <%=zdzk%>
        <input name="zdzk" type="hidden" value="<%=zdzk%>" >
      </td>
      <td align="left"><%=gycl%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
      </td>
      <td align="left"><%=flmcgg%>
        <input name="flmcgg" type="hidden" value="<%=flmcgg%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td ><%=glxmbh%>
        <input name="glxmbh" type="hidden" value="<%=glxmbh%>" >
      </td>
      <td ><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td ><%=sfxyclstr%>
        <input name="sfxycl" type="hidden" value="<%=sfxycl%>" >
      </td>
      <td ><%=sfxyyjdstr%>
        <input name="sfxyyjd" type="hidden" value="<%=sfxyyjd%>" >
      </td>
    </tr>
    <%
	}

	int cfxh=0;
	for (int i=0;i<row ;i++ )
	{
		for (int j=i+1;j<row ;j++ )
		{
			if (xmbhStr[i].equals(xmbhStr[j]))
			{
				cfxh++;
				out.println("<BR>"+cfxh+":提醒！项目编号重复："+xmbhStr[i]);
			}
		}
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
        <input type="reset"  value="重输">
      共导入项目数：<%=row%>
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
