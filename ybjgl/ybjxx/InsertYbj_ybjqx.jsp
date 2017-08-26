<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");
String lrr=(String)session.getAttribute("yhmc");

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
String fbr=null;
String fbsj=null;
String fbsm=null;


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

	ls_sql="select ssfgs,sbr,sbsj,shr,shsj,shsm,bz,ybjyxq,fbr,fbsj,fbsm ";
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
		fbr=cf.fillNull(rs.getString("fbr"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		fbsm=cf.fillNull(rs.getString("fbsm"));
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
<title>取消样板间</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">取消样板间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertYbj_ybjqx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=khbh%> </font></td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=khxm%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">房屋地址</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=fwdz%> </font></td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">联系方式</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> <%=lxfs%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="32%"><font color="#0000CC"><%=sjs%></font></td>
              <td width="18%" align="right"><font color="#0000CC">质检姓名</font></td>
              <td width="32%"><font color="#0000CC"><%=zjxm%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">施工队</font></td>
              <td width="32%"><font color="#0000CC"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></font></td>
              <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="32%"><font color="#0000CC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">实际开工日期</font></td>
              <td width="32%"><font color="#0000CC"><%=sjkgrq%></font></td>
              <td width="18%" align="right"><font color="#0000CC">实际竣工日期</font></td>
              <td width="32%"><font color="#0000CC"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">申报人</td>
              <td width="32%"><%=sbr%></td>
              <td width="18%" align="right">申报时间</td>
              <td width="32%"><%=sbsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">审核人</td>
              <td width="32%"><%=shr%></td>
              <td width="18%" align="right">审核时间</td>
              <td width="32%"><%=shsj%></td>
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
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right">风格分类</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right">面积</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">油色</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right">材质</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">样板间有效期</div>
              </td>
              <td width="32%"> <%=ybjyxq%> </td>
              <td width="18%"> 
                <div align="right">所属分公司</div>
              </td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">发布人</div>
              </td>
              <td width="32%"> <%=fbr%> </td>
              <td width="18%"> 
                <div align="right">发布时间</div>
              </td>
              <td width="32%"> <%=fbsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">发布说明</td>
              <td colspan="3"> <%=fbsm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>取消人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qxr" value="<%=lrr%>" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>取消时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qxsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></div>
              </td>
              <td width="32%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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

	if(	javaTrim(FormName.qxr)=="") {
		alert("请输入[取消人]！");
		FormName.qxr.focus();
		return false;
	}
	if(	javaTrim(FormName.qxsj)=="") {
		alert("请输入[取消时间]！");
		FormName.qxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qxsj, "取消时间"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
