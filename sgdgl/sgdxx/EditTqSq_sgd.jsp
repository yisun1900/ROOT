<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgd=null;
String sgdmc=null;
String sgdlx=null;
String dz=null;
String dh=null;
String cz=null;
String email=null;
String dqbm=null;
String bz=null;
String cxbz=null;
String ssfgs=null;
String jjlxr=null;
String lxrdh=null;
String sfzhm=null;
String hjszd=null;
String duihao=null;
String sgdjbbm=null;

double yqzbj=0;
double zbj=0;
double bzj=0;
String tdbz=null;
String tdkssj=null;
String tdzzsj=null;
String bzs=null;
String jcf=null;
String sfqldht=null;

String kjdsm=null;
String jjlxrdz=null;
int grs=0;
String rzsj=null;
String lzsj=null;

String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select yqzbj,grs,rzsj,lzsj,jjlxrdz,kjdsm,sfqldht,jcf,zbj,bzj,tdbz,tdkssj,tdzzsj,bzs,duihao,sgdjbbm,hjszd,sgd,sgdmc,sgdlx,dz,dh,cz,email,bz,dqbm,cxbz,ssfgs,jjlxr,lxrdh,sfzhm";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		yqzbj=rs.getDouble("yqzbj");
		grs=rs.getInt("grs");
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzsj=cf.fillNull(rs.getDate("lzsj"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
		kjdsm=cf.fillNull(rs.getString("kjdsm"));
		sfqldht=cf.fillNull(rs.getString("sfqldht"));
		jcf=cf.fillNull(rs.getString("jcf"));
		zbj=rs.getDouble("zbj");
		bzj=rs.getDouble("bzj");
		tdbz=cf.fillNull(rs.getString("tdbz"));
		tdkssj=cf.fillNull(rs.getDate("tdkssj"));
		tdzzsj=cf.fillNull(rs.getDate("tdzzsj"));
		bzs=cf.fillNull(rs.getString("bzs"));

		duihao=cf.fillNull(rs.getString("duihao"));
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		hjszd=cf.fillNull(rs.getString("hjszd"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgdlx=cf.fillNull(rs.getString("sgdlx"));
		dz=cf.fillNull(rs.getString("dz"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		email=cf.fillNull(rs.getString("email"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>DQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请修改工长信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">工长编号</font></div>              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgd" size="20" maxlength="5"  value="<%=sgd%>" readonly>              </td>
              <td width="20%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font>工长名称</div>              </td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgdmc" size="20" maxlength="100"  value="<%=sgdmc%>" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF">队号</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <input type="text" name="duihao" value="<%=duihao%>" size="20" maxlength="20" >              </td>
              <td width="20%" align="right" bgcolor="#CCCCFF">级别</td>
              <td width="30%" bgcolor="#CCCCFF"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>工长类型</td>
              <td width="31%"> 
                <input type="hidden" name="oldsgdmc" value="<%=sgdmc%>" >
                <select name="sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"S0+施工队&S1+直属施工队",sgdlx);
%> 
                </select>              </td>
              <td width="20%" align="right">工长家庭地址</td>
              <td width="30%"> 
                <input type="text" name="dz" size="20" maxlength="100"  value="<%=dz%>" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>所属分公司</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') and dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="20%" align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td width="30%" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>所属地区</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="20%" align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td width="30%" bgcolor="#CCCCFF">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>工长电话</td>
              <td colspan="3"> 
                <input type="text" name="dh" size="72" maxlength="100"  value="<%=dh%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">户籍所在地</td>
              <td colspan="3"> 
                <input type="text" name="hjszd" value="<%=hjszd%>" size="72" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">派单说明</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="kjdsm" value="<%=kjdsm%>" size="72" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">紧急联系人</td>
              <td width="31%"> 
                <input type="text" name="jjlxr" value="<%=jjlxr%>" size="20" maxlength="20" >              </td>
              <td width="20%" align="right">联系人电话</td>
              <td width="30%"> 
                <input type="text" name="lxrdh" value="<%=lxrdh%>" size="20" maxlength="50" >              </td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">紧急联系人地址</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text"  value="<%=jjlxrdz%>" size="72" maxlength="50" ></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">工长身份证号</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="20" >              </td>
              <td width="20%" bgcolor="#FFFFFF" align="right">工长传真</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="cz" size="20" maxlength="20"  value="<%=cz%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">要求质保金</td>
              <td><input type="text" name="yqzbj" size="20" maxlength="10"  value="<%=yqzbj%>" ></td>
              <td colspan="2">公司要求的最低质保金，达到此标准，施工队结算不扣质保金</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#0000FF">质保金</font></td>
              <td width="31%"> 
                <input type="text" name="zbj" size="20" maxlength="10"  value="<%=zbj%>" readonly>              </td>
              <td width="20%" align="right"><font color="#0000CC">保证金</font></td>
              <td width="30%"><input name="bzj" type="text" id="bzj"  value="<%=bzj%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">班组数</td>
              <td><input type="text" name="bzs" size="20" maxlength="10"  value="<%=bzs%>" ></td>
              <td align="right">工人数</td>
              <td><input type="text" name="grs" size="20" maxlength="10"  value="<%=grs%>" ></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">停单标志</td>
              <td width="31%"> 
                <select name="tdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"N+不停单&Y+停单",tdbz);
%> 
                </select>              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>撤销标志</td>
              <td width="30%"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"Y+已撤销&N+未撤销",cxbz);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">停单开始时间</td>
              <td width="31%"> 
                <input type="text" name="tdkssj" size="20" maxlength="10"  value="<%=tdkssj%>" >              </td>
              <td width="20%" align="right">停单终止时间</td>
              <td width="30%"> 
                <input type="text" name="tdzzsj" size="20" maxlength="10"  value="<%=tdzzsj%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">入职时间</td>
              <td><input type="text" name="rzsj" size="20" maxlength="10"  value="<%=rzsj%>" onDblClick="JSCalendar(this)"></td>
              <td align="right">离职时间</td>
              <td><input type="text" name="lzsj" size="20" maxlength="10"  value="<%=lzsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">考评基础分</td>
              <td width="31%"> 
                <input type="text" name="jcf" size="20" maxlength="10"  value="<%=jcf%>" >              </td>
              <td width="20%" align="right">是否签劳动合同</td>
              <td width="30%"><%
	cf.radioToken(out, "sfqldht","Y+是&N+否",sfqldht);
%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">备注</div>              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="70" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input name="button" type="button" onClick="f_lrcq(editform)"  value="可接单城区" >
                  <input name="button" type="button" onClick="f_lrdm(editform)"  value="可接单店面" >
                  <input name="button2" type="button" onClick="f_lrqy(editform)"  value="可接单区域" >
                  <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
                </div>              </td>
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[工长编号]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdmc)=="") {
		alert("请输入[工长名称]！");
		FormName.sgdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[工长电话]！");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdlx)=="") {
		alert("请选择[单位类型]！");
		FormName.sgdlx.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if(!(isNumber(FormName.jcf, "考评基础分"))) {
		return false;
	}
	if(	javaTrim(FormName.bzs)=="") {
		alert("请选择[班组数]！");
		FormName.bzs.focus();
		return false;
	}
	if(!(isNumber(FormName.bzs, "班组数"))) {
		return false;
	}

	if(	javaTrim(FormName.grs)=="") {
		alert("请选择[工人数]！");
		FormName.grs.focus();
		return false;
	}
	if(!(isNumber(FormName.grs, "工人数"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "离职时间"))) {
		return false;
	}

	if (FormName.tdbz.value=="Y")
	{
		if(	javaTrim(FormName.tdkssj)=="") {
			alert("请输入[停单开始时间]！");
			FormName.tdkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.tdkssj, "停单开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.tdzzsj)=="") {
			alert("请输入[停单终止时间]！");
			FormName.tdzzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.tdzzsj, "停单终止时间"))) {
			return false;
		}
	}
	else{
		FormName.tdkssj.value="";
		FormName.tdzzsj.value="";
	}

	if(	javaTrim(FormName.yqzbj)=="") {
		alert("请选择[要求质保金]！");
		FormName.yqzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.yqzbj, "要求质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.zbj)=="") {
		alert("请选择[累计质保金]！");
		FormName.zbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zbj, "累计质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.bzj)=="") {
		alert("请选择[累计保证金]！");
		FormName.bzj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzj, "累计保证金"))) {
		return false;
	}

	FormName.action="SaveEditTqSq_sgd.jsp";
	FormName.submit();
	return true;
}

function f_lrcq(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("请输入[工长编号]！");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjdcq.jsp";
	FormName.submit();
	return true;
}

function f_lrqy(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("请输入[工长编号]！");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjdqy.jsp";
	FormName.submit();
	return true;
}


function f_lrdm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("请输入[工长编号]！");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjddm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
