<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>投诉出现场</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));



String slfsbm=null;
String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sfxhf=null;
String hfsj=null;
String clzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String slbm=null;
String tsnr=null;
String tsbxsj=null;
String zrbmclzt=null;
String sfxtz=null;
String lrr=null;
String lrsj=null;
String slr=null;
String slsj=null;
String zrbm=null;
String ssfgs=null;

String ldyqjjsj=null;
String ldclyj=null;
String ldclr=null;
String ldclsj=null;
String jhcxcsj=null;
String jhcfasj=null;
String jhjjsj=null;

String kcjlh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.fgsbh,crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.zrbmclzt,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,clzt,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		sfxtz=cf.fillNull(rs.getString("sfxtz"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));

	}
	rs.close();
	ps.close();

	ls_sql="select jhcxcsj,jhcfasj,jhjjsj,ldyqjjsj,ldclyj,ldclr,ldclsj";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhcxcsj=cf.fillNull(rs.getDate("jhcxcsj"));
		jhcfasj=cf.fillNull(rs.getDate("jhcfasj"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		ldclyj=cf.fillHtml(rs.getString("ldclyj"));
		ldclr=cf.fillHtml(rs.getString("ldclr"));
		ldclsj=cf.fillHtml(rs.getDate("ldclsj"));
	}
	rs.close();
	ps.close();
	
	int count=0;
	ls_sql="select NVL(max(substr(kcjlh,11,2)),0)";
	ls_sql+=" from  crm_tsbxxckcjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	kcjlh=tsjlh+cf.addZero(count+1,2);
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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">投诉出现场（<font color="#0033CC">勘查记录号：<%=kcjlh%></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户编号</font> </td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">合同号</font> </td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户姓名</font></td>
      <td><%=khxm%></td>
      <td align="right"><font color="#0000CC">签约店面</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">房屋地址</font></td>
      <td><%=fwdz%></td>
      <td align="right"><font color="#0000CC">电话</font></td>
      <td><%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">设计师</font> </td>
      <td><%=sjs%> </td>
      <td align="right"><font color="#0000CC">质检员</font> </td>
      <td><%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">施工队</font> </td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>      </td>
      <td align="right"><font color="#0000CC">施工班组</font> </td>
      <td><%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">计划开工日期</font></td>
      <td><%=kgrq%> </td>
      <td align="right"><font color="#0000CC">计划交工日期</font></td>
      <td><%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">实开工日期</font></td>
      <td><%=sjkgrq%> </td>
      <td align="right"><font color="#0000CC">实交工日期</font></td>
      <td><%=sjjgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">严重程度</td>
      <td><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
      <td align="right">处理状态</td>
      <td><%
	cf.selectToken(out,"0+未受理&1+已受理&2+在处理&3+结案&9+不立案",clzt,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">客户投诉时间</td>
      <td><%=tsbxsj%></td>
      <td align="right">投诉来源</td>
      <td><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否需回访</td>
      <td><%
	cf.selectToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%></td>
      <td align="right">回访时间</td>
      <td><%=hfsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">受理人</td>
      <td><%=slr%></td>
      <td align="right">受理时间</td>
      <td><%=slsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">备注</td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">投诉记录号</font></td>
      <td width="32%"> 
        <input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="9" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">投诉原因</font></td>
      <td width="31%"><select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">客户要求解决时间</td>
      <td><%=yqjjsj%></td>
      <td align="right">领导要求解决时间</td>
      <td><%=ldyqjjsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">领导处理意见</td>
      <td colspan="3"><%=ldclyj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">领导处理人</td>
      <td><%=ldclr%></td>
      <td align="right">领导处理时间</td>
      <td><%=ldclsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>出现场情况</td>
      <td colspan="3"> 
        <textarea name="xcqk" cols="71" rows="9"></textarea>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><font color="#0000CC">计划出现场时间</font></td>
      <td><input type="text" name="jhcxcsj" value="<%=jhcxcsj%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>出现人</td>
      <td width="32%"> 
        <input type="text" name="kcr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>实际出现场时间</td>
      <td width="31%"> 
        <input type="text" name="kcsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>方案是否需审核</td>
      <td colspan="3"><INPUT type="radio" name="clzt" value="8" onClick="fash.style.display='none';fanr.style.display='block'">
        出方案，方案不需审核<BR>
        <INPUT type="radio" name="clzt" value="9" onClick="fash.style.display='block';fanr.style.display='block'">
      出方案，方案需审核<BR>
        <INPUT type="radio" name="clzt" value="A" onClick="fash.style.display='block';fanr.style.display='none'">
      已出现场等待方案<BR>
        <INPUT type="radio" name="clzt" value="3" onClick="fash.style.display='block'">
      已解决	  </td>
    </tr>
    
    <tr bgcolor="#FFFFFF" >
      <td align="right"><font color="#FF0000">*</font>计划出方案时间</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" value="<%=jhcfasj%>" onDblClick="JSCalendar(this)"></td>
      <td align="right"><font color="#FF0000">*</font>计划解决时间</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" value="<%=jhjjsj%>" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
      <td align="right"><font color="#FF0000">*</font>实际出方案时间</td>
      <td><input type="text" name="sjcfasj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
      <td align="right"><font color="#FF0000">*</font>实际解决时间</td>
      <td><input type="text" name="sjjjsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
      <td align="right"><font color="#FF0000">*</font>方案审核部门</td>
      <td><select name="fashbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(editform)">
          <option value=""></option>
          <%
	String sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh";
	cf.selectItem(out,sql,"");
%>
      </select></td>
      <td align="right"><font color="#FF0000">*</font>方案审核人</td>
      <td><select name="fashr" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
      </select></td>
    </tr>
    <tr  bgcolor="#FFFFFF" id="fanr" style="display:none">
      <td align="right"><font color="#FF0000">*</font>解决方案</td>
      <td colspan="3"><textarea name="jjfa" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr  bgcolor="#FFFFFF" id="fanr" style="display:none">
      <td align="right"><font color="#FF0000">*</font>最终处理结果</td>
      <td colspan="3"><textarea name="zzcljg" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0033CC">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">录入部门</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
        </select>      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="上传照片" onClick="f_lr(insertform)" name="lr" disabled>
        <input type="button"  value="查看照片" onClick="f_ck(insertform)" name="ck" disabled>
        <input type="reset"  value="重输" name="reset">
        <input type="hidden" name="kcjlh" value="<%=kcjlh%>" ></td>
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
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请输入[投诉原因]！");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.xcqk)=="") {
		alert("请输入[现场情况]！");
		FormName.xcqk.focus();
		return false;
	}
	if(	javaTrim(FormName.kcr)=="") {
		alert("请输入[勘查人]！");
		FormName.kcr.focus();
		return false;
	}
	if(	javaTrim(FormName.kcsj)=="") {
		alert("请输入[勘查时间]！");
		FormName.kcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kcsj, "勘查时间"))) {
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
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_tsbxxckcjl.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
