<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String czbm=null;
String ysbm=null;
String ybjbz=null;
String ybjdjsj=null;

String sjs=null;
String sgd=null;
String zjxm=null;
String dwbh=null;
String sjkgrq=null;
String sjjgrq=null;

String ssfgs=null;
String sbr=null;
String sbsj=null;
String shr=null;
String shsj=null;
String shsm=null;
String sbbz=null;
String ybjyxq=null;


String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,khxm,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm,czbm,ybjbz,ybjyxq,ybjdjsj,sjs,sgd,zjxm,dwbh,sjkgrq,sjjgrq ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		ybjbz=cf.fillNull(rs.getString("ybjbz"));

		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select ssfgs,sbr,sbsj,shr,shsj,shsm,bz,ybjyxq ";
	ls_sql+=" from  ybj_ybjsb";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sbr=cf.fillNull(rs.getString("sbr"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));
		sbbz=cf.fillNull(rs.getString("bz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>样板间登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">样板间发布</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveFbEditYbj_ybjsb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=khbh%> </font></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> <%=khxm%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">房屋地址</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=fwdz%> </font></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">联系方式</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> <%=lxfs%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="32%"><font color="#0000CC"><%=sjs%></font></td>
              <td width="17%" align="right"><font color="#0000CC">质检姓名</font></td>
              <td width="33%"><font color="#0000CC"><%=zjxm%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">施工队</font></td>
              <td width="32%"><font color="#0000CC"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></font></td>
              <td width="17%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="33%"><font color="#0000CC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">实际开工日期</font></td>
              <td width="32%"><font color="#0000CC"><%=sjkgrq%></font></td>
              <td width="17%" align="right"><font color="#0000CC">实际竣工日期</font></td>
              <td width="33%"><font color="#0000CC"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">申报人</td>
              <td width="32%"><%=sbr%></td>
              <td width="17%" align="right">申报时间</td>
              <td width="33%"><%=sbsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">审核人</td>
              <td width="32%"><%=shr%></td>
              <td width="17%" align="right">审核时间</td>
              <td width="33%"><%=shsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">审核说明</td>
              <td colspan="3"><%=shsm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"><%=sbbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">户型</div>
              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">风格分类</div>
              </td>
              <td width="33%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="32%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">面积</div>
              </td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">油色</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">材质</div>
              </td>
              <td width="33%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>样板间有效期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ybjyxq" size="20" maxlength="10"  value="<%=ybjyxq%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">所属分公司</font></div>
              </td>
              <td width="33%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">发布人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="fbr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">发布时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">发布说明</td>
              <td colspan="3"> 
                <textarea name="fbsm" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("请输入[装修价位]！");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请输入[油色]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.czbm)=="") {
		alert("请输入[材质]！");
		FormName.czbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("请输入[面积编码]！");
		FormName.hxmjbm.focus();
		return false;
	}
	

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ybjyxq)=="") {
		alert("请输入[样板间有效期]！");
		FormName.ybjyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.ybjyxq, "样板间有效期"))) {
		return false;
	}

	if(	javaTrim(FormName.fbr)=="") {
		alert("请输入[发布人]！");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("请输入[发布时间]！");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "发布时间"))) {
		return false;
	}

	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
