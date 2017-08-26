<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
String zlhxmj=null;
String lxsj=null;
String fyssj=null;
String jfhs=null;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherexqmc=cf.getParameter(request,"xqmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw,lrr,lrsj,fgsbh ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (xqmc='"+wherexqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		jw=cf.fillNull(rs.getString("jw"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYx_lsdcb.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>地区</td>
      <td width="32%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>公司</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>城区</td>
      <td width="32%"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>小区名称</td>
      <td colspan="3"> 
        <input type="text" name="xqmc" size="74" maxlength="50"  value="<%=xqmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>地址</td>
      <td colspan="3"> 
        <input type="text" name="dz" size="74" maxlength="100"  value="<%=dz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>开发商</td>
      <td colspan="3"> 
        <input type="text" name="kfs" size="74" maxlength="50"  value="<%=kfs%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">开发商联系人</td>
      <td width="32%"> 
        <input type="text" name="kfslxr" size="20" maxlength="20"  value="<%=kfslxr%>" >
      </td>
      <td align="right" width="18%">开发商联系人职务</td>
      <td width="32%"> 
        <input type="text" name="kfslxrzw" size="20" maxlength="20"  value="<%=kfslxrzw%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">开发商联系人电话</td>
      <td width="32%"> 
        <input type="text" name="kfslxrdh" size="20" maxlength="20"  value="<%=kfslxrdh%>" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">物业公司名称</td>
      <td colspan="3"> 
        <input type="text" name="wygsmc" size="74" maxlength="50"  value="<%=wygsmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">物业联系人</td>
      <td width="32%"> 
        <input type="text" name="wylxr" size="20" maxlength="20"  value="<%=wylxr%>" >
      </td>
      <td align="right" width="18%">物业联系人职务</td>
      <td width="32%"> 
        <input type="text" name="wylxrzw" size="20" maxlength="20"  value="<%=wylxrzw%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">物业电话</td>
      <td width="32%"> 
        <input type="text" name="wydh" size="20" maxlength="40"  value="<%=wydh%>" >
      </td>
      <td align="right" width="18%">立项时间</td>
      <td width="32%"> 
        <input type="text" name="lxsj" size="20" maxlength="10"  value="<%=lxsj%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">交钥匙时间</td>
      <td width="32%"> 
        <input type="text" name="fyssj" size="20" maxlength="10"  value="<%=fyssj%>" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">交房户数</td>
      <td width="32%"> 
        <input type="text" name="jfhs" size="20" maxlength="8"  value="<%=jfhs%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">主力户型</td>
      <td width="32%"> 
        <input type="text" name="zlhx" size="20" maxlength="20"  value="<%=zlhx%>" >
      </td>
      <td align="right" width="18%">主力户型面积</td>
      <td width="32%"> 
        <input type="text" name="zlhxmj" size="20" maxlength="8"  value="<%=zlhxmj%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">物业形式</td>
      <td width="32%"> 
        <input type="text" name="wyxs" size="20" maxlength="20"  value="<%=wyxs%>" >
      </td>
      <td align="right" width="18%">价位</td>
      <td width="32%"> 
        <input type="text" name="jw" size="20" maxlength="40"  value="<%=jw%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">小区负责人</td>
      <td width="32%"> 
        <input type="text" name="xqfzr" size="20" maxlength="20"  value="<%=xqfzr%>" >
      </td>
      <td align="right" width="18%">小区负责人电话</td>
      <td width="32%"> 
        <input type="text" name="xqfzrdh" size="20" maxlength="20"  value="<%=xqfzrdh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">楼盘性质</td>
      <td width="32%">
        <input type="text" name="xz" size="20" maxlength="50"  value="<%=xz%>" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>录入人</td>
      <td width="32%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>录入时间</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
    <input type="hidden" name="wherexqmc"  value="<%=wherexqmc%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[城区编码]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dz)=="") {
		alert("请输入[地址]！");
		FormName.dz.focus();
		return false;
	}
	if(!(isNumber(FormName.zlhxmj, "主力户型面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.lxsj, "立项时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fyssj, "交钥匙时间"))) {
		return false;
	}
	if(!(isNumber(FormName.jfhs, "交房户数"))) {
		return false;
	}
	if(	javaTrim(FormName.kfs)=="") {
		alert("请输入[开发商]！");
		FormName.kfs.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[公司编码]！");
		FormName.fgsbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
