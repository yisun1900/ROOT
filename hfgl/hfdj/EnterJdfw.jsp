<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>回访冻结</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sjkgrq=null;
String djbh=null;
String hfdjbz=null;
String hfdjbzmc=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	ls_sql="select khxm,fwdz,sjs,zjxm,sgdmc,sjkgrq,djbh,DECODE(hfdjbz,0,'未冻结',1,'工程回访冻结',2,'投诉报修回访冻结',3,'全部冻结') hfdjbzmc, hfdjbz,djyy,djsj,djr,jhjdsj";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=cf.fillNull(rs.getString("sgdmc"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		hfdjbzmc=cf.fillNull(rs.getString("hfdjbzmc"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
	
	}
	rs.close();
	ps.close();
	

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
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="65" colspan="4"> 
        <div align="center">客户回访解冻（冻结编号：<%=djbh%>）</div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">客户编号</font></td>
      <td width="28%"> 
        <input type="text" name="khbh" size="20" maxlength="20" value="<%=khbh%>" readonly>
        <input type="hidden" name="djbh" value="<%=djbh%>" >
      </td>
      <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="20" value="<%=khxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="22%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> 
        <input type="text" name="khbh2" size="68" maxlength="100" value="<%=fwdz%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">设计师</font></td>
      <td width="28%"> 
        <input type="text" name="sjs" size="20" maxlength="20" value="<%=sjs%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">质检姓名</font></td>
      <td width="33%"> 
        <input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"><font color="#0000CC">施工队</font></td>
      <td width="28%"> 
        <input type="text" name="sgd" size="20" maxlength="20" value="<%=sgd%>" readonly>
      </td>
      <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
      <td width="33%"> 
        <input type="text" name="sjkgrq" size="20" maxlength="20" value="<%=sjkgrq%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">冻结范围</td>
      <td width="28%"><%=hfdjbzmc%></td>
      <td width="17%" align="right">冻结人</td>
      <td width="33%"><%=djr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%"> 冻结时间</td>
      <td width="28%"> <%=djsj%> </td>
      <td width="17%" align="right">计划解冻时间</td>
      <td width="33%"> <%=jhjdsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">冻结原因</td>
      <td colspan="3"> <%=djyy%> </td>
    </tr>
    <tr bgcolor="#CCFFCC"> 
      <td align="right" width="22%">实际解冻时间</td>
      <td width="28%"> 
        <input type="text" name="sjjdsj" size="20" maxlength="10" value="<%=cf.today()%>">
      </td>
      <td width="17%" align="right">解冻人</td>
      <td width="33%"> 
        <input type="text" name="jdr" size="20" maxlength="20" value="<%=yhdlm%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">是否需工程回访</td>
      <td width="28%"> 
        <input type="radio" name="sfxhf"  value="Y">
        需回访 
        <input type="radio" name="sfxhf"  value="N" onClick="f1(selectform)">
        不需回访 </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">工程回访类型</td>
      <td width="28%"> 
        <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right">工程回访日期</td>
      <td width="33%"> 
        <input type="text" name="hfrq" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="工程回访解冻" onClick="f_gcdo(selectform)" <% if (hfdjbz.equals("0") || hfdjbz.equals("2")) out.println("disabled"); %>>
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">投诉报修是否需回访</td>
      <td width="28%"> 
        <input type="radio" name="tssfxhf"  value="Y">
        需回访 
        <input type="radio" name="tssfxhf"  value="N" onClick="f2(selectform)">
        不需回访 </td>
      <td width="17%" align="right">投诉报修回访日期</td>
      <td width="33%"> 
        <input type="text" name="hfsj"  size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="投诉报修回访解冻" onClick="f_tsdo(selectform)" <% if (hfdjbz.equals("0") || hfdjbz.equals("1")) out.println("disabled"); %>>
        </div>
      </td>
    </tr>
  </table>
</form>

<P><center>投诉报修记录</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">受理序号</td>
	<td  width="5%">受理方式</td>
	<td  width="8%">大类</td>
	<td  width="14%">小类</td>
	<td  width="24%">投诉报修内容</td>
	<td  width="7%">受理时间</td>
	<td  width="10%">受理部门</td>
	<td  width="7%">需回访时间</td>
	<td  width="7%">处理状态</td>
	<td  width="7%">冻结标志</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT distinct crm_tsjl.tsjlh as tsjlh,dm_slfsbm.slfsmc,dm_tslxbm.tslxmc,dm_tsyybm.tsyymc,crm_tsjl.tsnr,crm_tsjl.slsj,dwmc,crm_tsjl.hfsj,DECODE(crm_tsjl.clzt,0,'非客服登记',1,'客服受理',2,'在处理',3,'结案') as clzt,DECODE(hfdjbz,'Y','回访冻结','N','未冻结') ";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_slfsbm,dm_tslxbm,dm_tsyybm,sq_dwxx  ";
    ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tslxbm=dm_tslxbm.tslxbm ";
    ls_sql+=" and crm_tsjl.slbm=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"' and crm_tsjl.hfdjbz='Y' and crm_tsjl.clzt!='3'";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
    ls_sql+=" order by crm_tsjl.slsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","JdCrm_tsjl.jsp");
	pageObj.setEditStr("设置回访时间");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f1(FormName)//参数FormName:Form的名称
{
	if (FormName.sfxhf[0].checked)
	{
	}
	else{
		FormName.hfrq.value='';
		FormName.hflxbm.value='';
	}
}
function f_gcdo(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("请选择[实际解冻时间]！");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "实际解冻时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jdr)=="") {
		alert("请选择[解冻人]！");
		FormName.jdr.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hflxbm)=="") {
			alert("请选择[回访类型]！");
			FormName.hflxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.hfrq)=="") {
			alert("请选择[回访日期]！");
			FormName.hfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfrq, "回访日期"))) {
			return false;
		}
	}

	FormName.action="SaveGchfJd.jsp";
	FormName.submit();
	return true;
}

function f2(FormName)//参数FormName:Form的名称
{
	if (FormName.tssfxhf[0].checked)
	{
	}
	else{
		FormName.hfsj.value='';
	}
}
function f_tsdo(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("请选择[实际解冻时间]！");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "实际解冻时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jdr)=="") {
		alert("请选择[解冻人]！");
		FormName.jdr.focus();
		return false;
	}
	if(	!radioChecked(FormName.tssfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.tssfxhf[0].focus();
		return false;
	}

	if (FormName.tssfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("请选择[回访日期]！");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "回访日期"))) {
			return false;
		}
	}

	FormName.action="SaveTsBxhfJd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
