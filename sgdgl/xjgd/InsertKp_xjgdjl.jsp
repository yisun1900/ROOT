<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

//String xjr=cf.GB2Uni(request.getParameter("ysr"));
String xjr="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//检查记录号
String xjjlh=null;
String jhbh="";
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

String zpml=cf.today("YYYYMM");

int count=0;

try {
	conn=cf.getConnection();

//检查记录号
	ls_sql="select NVL(max(substr(xjjlh,8,3)),0)";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xjjlh=khbh+cf.addZero(count+1,3);

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,crm_khxx.sgd,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

	if (xjr.equals(""))
	{
		xjr=zjxm;
	}


}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="6%">检查记录号</td>
		<td  width="5%">施工队</td>
		<td  width="5%">罚款总额</td>
		<td  width="5%">扣分</td>
		<td  width="6%">扣除接单额百分比</td>
		<td  width="5%">检查人</td>
		<td  width="7%">检查时间</td>
		<td  width="10%">检查类型</td>
		<td  width="8%">检查结果</td>
		<td  width="6%">审批标志</td>
		<td  width="58%">备注</td>
	</tr>
<%
	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,fkze,kfzs,kp_xjgdjl.kcjdebl||'%',kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,DECODE(kp_xjgdjl.cfspbz,'1','不需审批','2','未审批','3','审批通过','4','审批未通过','5','审批确认'),kp_xjgdjl.bz";
	ls_sql+=" FROM kp_xjgdjl,sq_sgd,kp_xjlxbm,dm_xjjgbm  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
    ls_sql+=" and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>
<BR>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">验收记录号</td>
	<td  width="7%">验收项目</td>
	<td  width="3%">验收人</td>
	<td  width="5%">验收时间</td>
	<td  width="4%">验收结果</td>
	<td  width="4%">处理标志</td>
	<td  width="5%">接收时间</td>
	<td  width="5%">计划解决时间</td>
	<td  width="3%">接收人</td>
	<td  width="12%">接收说明</td>
	<td  width="5%">解决时间</td>
	<td  width="3%">解决人</td>
	<td  width="12%">解决说明</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="163%">备注</td>
</tr>
<%
	ls_sql="SELECT crm_ysjl.ysjlh,dm_gcysxm.gcysxmmc,crm_ysjl.ysr,TO_CHAR(crm_ysjl.yssj,'YYYY-MM-DD'),sjysjg,clbz,TO_CHAR(jssj,'YYYY-MM-DD'),TO_CHAR(jhjjsj,'YYYY-MM-DD'),jsr,jssm,TO_CHAR(jjsj,'YYYY-MM-DD'),jjr,jjsm,crm_ysjl.lrr,crm_ysjl.lrsj,crm_ysjl.bz  ";
	ls_sql+=" FROM crm_ysjl,dm_gcysxm ";
    ls_sql+=" where crm_ysjl.gcysxmbm=dm_gcysxm.gcysxmbm(+) ";
    ls_sql+=" and crm_ysjl.khbh='"+khbh+"'";
	ls_sql+=" order by crm_ysjl.ysjlh ";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/pzgl/sgjdb/ViewCrm_ysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 


</table>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">检查工地（记录号：<%=xjjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#000099">客户编号</font></div>              </td>
              <td width="33%"><%=khbh%> </td>
              <td width="19%"> 
                <div align="right"><font color="#000099">实开工日期</font></div>              </td>
              <td width="31%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="33%"><%=khxm%></td>
              <td width="19%" align="right"><font color="#000099">联系方式</font></td>
              <td width="31%"><input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">设计师</font></td>
              <td width="33%"><%=sjs%></td>
              <td width="19%" align="right"><font color="#000099">施工队</font></td>
              <td width="31%"><%=sgdmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#000099">监察姓名</font></td>
              <td width="33%"><%=zjxm%></td>
              <td width="19%" align="right"><font color="#000099">施工班组</font></td>
              <td width="31%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>检查类型</td>
              <td width="33%"> 
                <select name="xjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jszk(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm","");
%> 
                </select>              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>检查人</td>
              <td colspan="3"><input type="text" name="xjr" value="<%=xjr%>" size="74" maxlength="200"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>奖励金额</td>
              <td><input type="text" name="jlje" value="0" size="20" maxlength="16" ></td>
              <td align="right"><font color="#FF0000">*</font>检查时间</td>
              <td><input type="text" name="xjsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
              <td width="33%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
                </select>              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">备注</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="5"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="xjjgbm" value="00" >
                <input type="hidden" name="xjjlh" value="<%=xjjlh%>" >
                <input type="hidden" name="jhbh" value="<%=jhbh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="sgd" value="<%=sgd%>" >
                <input type="hidden" name="zpml" value="<%=zpml%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="录入处罚项" onClick="window.open('yrk_lrxxmain.jsp?xjjlh=<%=xjjlh%>')" name="lr" disabled=true >
                <input type="button"  value="查看处罚项" onClick="window.open('Kp_xjgdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cx" disabled=true>
                <input type="button"  value="录入整改项" onClick="window.open('InsertKp_zggdmx.jsp?xjjlh=<%=xjjlh%>')" name="lrzg" disabled >
                <input type="button"  value="查看整改项" onClick="window.open('Kp_zggdmxList.jsp?xjjlh=<%=xjjlh%>')" name="cxzg" disabled>
                <input type="reset"  value="重输" name="reset">
                <br>
                <input type="button"  value="上传无问题照片" onClick="f_lrzp(insertform)" name="lrzp" disabled>
                <input type="button"  value="查看照片" onClick="f_ckzp(insertform)" name="ckzp" disabled></td>
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
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.xjjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.xjlxbm)=="") {
		alert("请输入[检查类型]！");
		FormName.xjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjjgbm)=="") {
		alert("请输入[检查结果]！");
		FormName.xjjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("请选择[奖励金额]！");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "奖励金额"))) {
		return false;
	}

	if(	javaTrim(FormName.xjr)=="") {
		alert("请输入[检查人]！");
		FormName.xjr.focus();
		return false;
	}
	if(	javaTrim(FormName.xjsj)=="") {
		alert("请输入[检查时间]！");
		FormName.xjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xjsj, "检查时间"))) {
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

	FormName.action="SaveInsertKp_xjgdjl.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.cx.disabled=false;
	FormName.lrzg.disabled=false;
	FormName.cxzg.disabled=false;
	FormName.lrzp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}
function f_jszk(FormName)//参数FormName:Form的名称
{
	if ((FormName.xjlxbm.options[1].selected))
	{
//		FormName.xjr.value="<%=zjxm%>";
	}
	else
	{
//		FormName.xjr.value="";
	}
	
}
function f_lrzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.xjjlh.focus();
		return false;
	}

	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		FormName.action="loadPhotoPad.jsp";
	}
	else
	{
		FormName.action="loadPhoto.jsp";
	}

	FormName.submit();
	return true;
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xjjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.xjjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
