<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khxm=null;
String fwdz=null;
String ssfgs=null;
String bjjb=null;
String bjbbh=null;
String dqbm=null;
String zcsfss=null;
String sjs="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;

String sfkdybj="";
String printMark="disabled";
String bjdysq="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,ssfgs,bjjb,bjbbh,zcsfss,bjdysq";
	ls_sql+=" ,sjs,cxhdbmxq,cxhdbmzh,cxhdbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjs=cf.fillNull(rs.getString("sjs"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		zcsfss=cf.fillNull(rs.getString("zcsfss"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
	}
	rs.close();
	ps.close();

	if (!bjdysq.equals("1"))
	{
		bjdysq="disabled";
	}
	else{
		bjdysq="";
	}

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
/*
	int count=0;
	cf.checkYjQmjz("cw_qmjz");

	if (count==1)
	{
		out.println("错误！最近一月未结转！");
		return;
	}
	else if (count==2)
	{
		out.println("至少最近两月未结转！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}
*/

	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价:Y：是；N：否
	}
	rs.close();
	ps.close();

	sfkdybj="Y";

	if (sfkdybj.equals("Y"))
	{
		printMark="";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
<title>设计师咨询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

        <form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4" height="25">
        重做电子报价
        <BR>
        <font color="#CC0000"><b><font color="#0000CC">（注意：重做报价后，必须操作『<font color="#CC0000">重做报价－完成</font>』，否则业绩不更新） 
        </font></b></font></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><strong>客户编号 </strong></td>
              <td><%=khbh%></td>
              <td align="right"><b>客户姓名</b></td>
              <td><%=khxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><b>房屋地址</b></td>
              <td bgcolor="#CCCCFF"><%=fwdz%></td>
              <td align="right" bgcolor="#CCCCFF">设计师</td>
              <td bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">参加公司促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbm%>
              <input name="button3" type="button" onClick="window.open('/dhzx/dhzx/zkzsxx.jsp?khbh=<%=khbh%>')" value="折扣赠送">
              <input name="button4" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="活动赠送信息">
              <input name="button22" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="调整代金券"></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">参加小区促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">参加展会促销活动</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmzh%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>报价级别</td>
              <td width="31%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>报价版本号</td>
              <td width="32%"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb where bj_dzbjbb.bjbbh='"+bjbbh+"' ",bjbbh);
%>
              </select></td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                    <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                    <input type="hidden" name="zcsfss"  value="<%=zcsfss%>" >
                    <input type="button"  value="选房间" onClick="f_lrfj(editform)" >
                    <input type="button"  value="修改房间" onClick="f_xgfj(editform)">
                    <input type="button" onClick="f_xzxm(editform)"  value="选报价项目">
                    <input type="button" onClick="f_fjxmpx(editform)"  value="调项目顺序" >
                    <input type="button" onClick="f_ewlr(editform)"  value="选其它收费">
                    <input type="button" onClick="f_ewck(editform)"  value="修改其它收费">
                    <input type="button" onClick="f_wc(editform)"  value="重做报价－完成">
                    <p>
                    <input type="button" onClick="f_drmb(editform)"  value="导入报价" >
                    <input type="button" onClick="f_bcmb(editform)"  value="报价另存为" >
                    <input type="button" onClick="f_excel(editform)"  value="导出报价" <%=bjdysq%>>
                    <input type="button" onClick="f_tbjjb(editform)"  value="调报价级别" >
                    <input type="button" onClick="f_tzk(editform)"  value="调折扣" >
                    <input type="button" onClick="f_dybj(editform)"  value="打印御览"  <%=printMark%>>
                    <input type="button" onClick="window.open('/zlkxt/loadWj.jsp?khbh=<%=khbh%>&khxm=<%=khxm%>')"  value="图纸上传">
                  </p>
                </div>				</td>
            </tr>
          </table>
        </form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_bcmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/cwmb.jsp";
	FormName.submit();
	return true;
}
function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/ChooseBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}
function f_ewck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_sfxmmxList.jsp";
	FormName.submit();
	return true;
}

function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCw_czbjsqjl.jsp";
	FormName.submit();
	return true;
}

function f_xzxm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_excel(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}


	FormName.action="/dhzx/sjszxone/ylbj.jsp?dqbm=<%=dqbm%>";

	FormName.submit();
	return true;
}

function f_drmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}



	FormName.action="/dzbjone/zxbjmx/drmb.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_edit(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_tbjjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditAllBjjb.jsp";

	FormName.submit();
	return true;
}

function f_xmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_fjxmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzFjXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}
function f_xmdj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzDjBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_dxzk(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	window.open("/dzbjone/zxbjmx/Bj_sfxmmxZklList.jsp?khbh=<%=khbh%>");
}

function f_zjsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/zjtccl.jsp";
	FormName.submit();
	return true;
}

function f_tzk(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dhzx/tzzk/index.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
