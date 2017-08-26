<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xqmc=null;
String yjfy=null;
String yjcc=null;
String sjfy=null;
String sjcc=null;
String spjl=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String bz=null;
String scbfzr=null;
String scbfzrdh=null;
String scbzrs=null;
String scbsffz=null;
String gjjzgwrs=null;
String ryydl=null;
String kfql=null;
String kfxs=null;
String wherexqmc=cf.getParameter(request,"xqmc");
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));


String dqbm=null;
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

String dwdz=null;
String dwdh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yjfy,yjcc,sjfy,sjcc,spjl,spr,spsj,spyj,lrr,lrsj,fgsbh,bz,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,kfql,kfxs ";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjfy=cf.fillNull(rs.getString("yjfy"));
		yjcc=cf.fillNull(rs.getString("yjcc"));
		sjfy=cf.fillNull(rs.getString("sjfy"));
		sjcc=cf.fillNull(rs.getString("sjcc"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));
		scbfzr=cf.fillNull(rs.getString("scbfzr"));
		scbfzrdh=cf.fillNull(rs.getString("scbfzrdh"));
		scbzrs=cf.fillNull(rs.getString("scbzrs"));
		scbsffz=cf.fillNull(rs.getString("scbsffz"));
		gjjzgwrs=cf.fillNull(rs.getString("gjjzgwrs"));
		ryydl=cf.fillNull(rs.getString("ryydl"));
		kfql=cf.fillNull(rs.getString("kfql"));
		kfxs=cf.fillNull(rs.getString("kfxs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwdz,dwdh,dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (xqmc='"+wherexqmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
<form method="post" action="SaveEditYx_xqcxhdgl.jsp" name="editform">
<div align="center">修改活动申请</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">小区名称</td>
      <td width="33%"><%=xqmc%></td>
      <td align="right" width="18%">地址</td>
      <td width="32%"><%=dz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">开发商</td>
      <td width="33%"><%=kfs%></td>
      <td align="right" width="18%">电话</td>
      <td width="32%"><%=kfslxrdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">开发商联系人</td>
      <td width="33%"><%=kfslxr%> </td>
      <td align="right" width="18%">开发商联系人职务</td>
      <td width="32%"><%=kfslxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">物业公司名称</td>
      <td colspan="3"><%=wygsmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">物业联系人</td>
      <td width="33%"><%=wylxr%> </td>
      <td align="right" width="18%">物业联系人职务</td>
      <td width="32%"><%=wylxrzw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">物业电话</td>
      <td width="33%"><%=wydh%> </td>
      <td align="right" width="18%">立项时间</td>
      <td width="32%"><%=lxsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">交钥匙时间</td>
      <td width="33%"><%=fyssj%> </td>
      <td align="right" width="18%">交房户数</td>
      <td width="32%"><%=jfhs%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">主力户型</td>
      <td width="33%"><%=zlhx%> </td>
      <td align="right" width="18%">主力户型面积</td>
      <td width="32%"><%=zlhxmj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">物业形式</td>
      <td width="33%"><%=wyxs%> </td>
      <td align="right" width="18%">价位</td>
      <td width="32%"><%=jw%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">小区负责人</td>
      <td width="33%"><%=xqfzr%> </td>
      <td align="right" width="18%">小区负责人电话</td>
      <td width="32%"><%=xqfzrdh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">楼盘性质</td>
      <td width="33%"><%=xz%> </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">公司</td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">地址</td>
      <td width="33%"><%=dwdz%></td>
      <td align="right" width="18%">电话</td>
      <td width="32%"><%=dwdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">市场部负责人</td>
      <td width="33%"> 
        <input type="text" name="scbfzr" size="20" maxlength="20"  value="<%=scbfzr%>" >
      </td>
      <td align="right" width="18%">市场部负责人电话</td>
      <td width="32%"> 
        <input type="text" name="scbfzrdh" size="20" maxlength="20"  value="<%=scbfzrdh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">市场部总人数</td>
      <td width="33%"> 
        <input type="text" name="scbzrs" size="20" maxlength="8"  value="<%=scbzrs%>" >
      </td>
      <td align="right" width="18%">市场部是否分组</td>
      <td width="32%"><%
	cf.radioToken(out, "scbsffz","N+未分组&Y+分组",scbsffz);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">高级家装顾问人数</td>
      <td width="33%"> 
        <input type="text" name="gjjzgwrs" size="20" maxlength="8"  value="<%=gjjzgwrs%>" >
      </td>
      <td align="right" width="18%">人员异动率</td>
      <td width="32%"> 
        <input type="text" name="ryydl" size="20" maxlength="9"  value="<%=ryydl%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">预计费用</td>
      <td width="33%"> 
        <input type="text" name="yjfy" size="20" maxlength="16"  value="<%=yjfy%>" >
      </td>
      <td align="right" width="18%">预计产出</td>
      <td width="32%"> 
        <input type="text" name="yjcc" size="20" maxlength="16"  value="<%=yjcc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">开发潜力</td>
      <td width="33%"> 
<%
	cf.radioToken(out, "kfql","A+A&B+B&C+C",kfql);
%>
      </td>
      <td align="right" width="18%">开发形式</td>
      <td width="32%"> 
        <input type="text" name="kfxs" size="20" maxlength="20"  value="<%=kfxs%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="18%">录入时间</td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexqmc"  value="<%=wherexqmc%>" >
    <input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yjfy)=="") {
		alert("请输入[预计费用]！");
		FormName.yjfy.focus();
		return false;
	}
	if(!(isNumber(FormName.yjfy, "预计费用"))) {
		return false;
	}
	if(	javaTrim(FormName.yjcc)=="") {
		alert("请输入[预计产出]！");
		FormName.yjcc.focus();
		return false;
	}
	if(!(isNumber(FormName.yjcc, "预计产出"))) {
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
		alert("请选择[公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isNumber(FormName.scbzrs, "市场部总人数"))) {
		return false;
	}
	if(!(isNumber(FormName.gjjzgwrs, "高级家装顾问人数"))) {
		return false;
	}
	if(!(isFloat(FormName.ryydl, "人员异动率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
