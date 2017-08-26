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
String xjr=cf.GB2Uni(request.getParameter("ysr"));
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//检查记录号
String jcjlh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String sgd=null;
String zjxm=null;
String sgbz=null;

int count=0;

try {
	conn=cf.getConnection();

//检查记录号
	ls_sql="select NVL(max(substr(jcjlh,8,3)),0)";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jcjlh=khbh+cf.addZero(count+1,3);

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
if (count>0)
{
	%>
	<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">检查记录号</td>
		<td  width="6%">施工队</td>
		<td  width="7%">罚款总额</td>
		<td  width="6%">扣分</td>
		<td  width="7%">扣除接单额百分比</td>
		<td  width="10%">检查类型</td>
		<td  width="12%">检查结果</td>
		<td  width="22%">问题分类</td>
		<td  width="6%">检查人</td>
		<td  width="8%">检查时间</td>
		<td  width="8%">审批标志</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT gdm_gdjcjl.jcjlh,sgdmc,fkze,kfzs,gdm_gdjcjl.kcjdebl||'%',xjlxmc,xjjgmc,xjwtflmc,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,DECODE(gdm_gdjcjl.cfspbz,'1','不需审批','2','未审批','3','审批通过','4','审批未通过')";
	ls_sql+=" FROM gdm_gdjcjl,sq_sgd,kp_jclxbm,dm_jcjgbm,dm_jcwtflbm  ";
    ls_sql+=" where gdm_gdjcjl.sgd=sq_sgd.sgd(+) and gdm_gdjcjl.jcjgbm=dm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=kp_jclxbm.jclxbm";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=dm_jcwtflbm.jcwtflbm(+)";
    ls_sql+=" and gdm_gdjcjl.khbh='"+khbh+"'";
    ls_sql+=" order by gdm_gdjcjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jcjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewGdm_gdjcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jcjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">法规工程担当处罚（记录号：<%=jcjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
               <font color="#000099">客户编号</font>            </td>
              <td width="32%"><%=khbh%> </td>
              <td width="18%" align="right"> <font color="#000099">实开工日期</font>              </td>
              <td width="32%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">房屋地址</font></td>
              <td width="32%"><%=fwdz%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">设计师</font></td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right"><font color="#000099">施工队</font></td>
              <td width="32%"><%=sgdmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">工程担当</font></td>
              <td width="32%"><%=zjxm%></td>
              <td width="18%" align="right"><font color="#000099">施工班组</font></td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>检查类型</td>
              <td width="32%"> 
                <select name="jclxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jszk(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jclxbm,jclxmc from gdm_jclxbm order by jclxbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>检查结果</td>
              <td width="32%"><select name="jcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
		cf.selectItem(out,"select jcjgbm,jcjgmc from gdm_jcjgbm order by jcjgbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">问题分类</td>
              <td><select name="jcwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
		cf.selectItem(out,"select jcwtflbm,jcwtflmc from gdm_jcwtflbm order by jcwtflbm","");
%>
              </select></td>
              <td align="right"><font color="#FF0000">*</font>奖励金额</td>
              <td><input type="text" name="jlje" value="0" size="20" maxlength="16" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <div align="right"><font color="#FF0000">*</font>检查人</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjr" value="" size="20" maxlength="20">              </td>
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>检查时间</div>              </td>
              <td width="32%"> 
              <input type="text" name="xjsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
              </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right">备注</div>              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="74" rows="5"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="sgd" value="<%=sgd%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="批量录入" onClick="window.open('PlInsertGdm_jcjlmx.jsp?jcjlh=<%=jcjlh%>')" name="pllr" disabled>
                <input type="button"  value="单项录入" onClick="window.open('yrk_lrxxmain.jsp?jcjlh=<%=jcjlh%>')" name="lr" disabled=true >
                <input type="button"  value="查看检查项目" onClick="window.open('Gdm_jcjlmxList.jsp?jcjlh=<%=jcjlh%>')" name="cx" disabled=true>
                <input type="button"  value="上传照片" onClick="f_lrzp(insertform)" name="lrzp" disabled>
                <input type="button"  value="查看照片" onClick="f_ckzp(insertform)" name="ckzp" disabled>
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
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
	if(	javaTrim(FormName.jclxbm)=="") {
		alert("请输入[检查类型]！");
		FormName.jclxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jcjgbm)=="") {
		alert("请输入[检查结果]！");
		FormName.jcjgbm.focus();
		return false;
	}
	if (FormName.jcjgbm.value=="11")
	{
		if(	javaTrim(FormName.jcwtflbm)!="") {
			alert("没问题，不能输入[问题分类]！");
			FormName.jcwtflbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.jcwtflbm)=="") {
			alert("请输入[问题分类]！");
			FormName.jcwtflbm.focus();
			return false;
		}
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

	FormName.action="SaveInsertGdm_gdjcjl.jsp";
	FormName.submit();
	FormName.pllr.disabled=false;
	FormName.lr.disabled=false;
	FormName.cx.disabled=false;
	FormName.lrzp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}
function f_jszk(FormName)//参数FormName:Form的名称
{
	if ((FormName.jclxbm.options[1].selected))
	{
		FormName.xjr.value="<%=zjxm%>";
	}
	else
	{
		FormName.xjr.value="";
	}
	
}
function f_lrzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
