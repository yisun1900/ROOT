<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
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

String cldwmc=null;

String dwmc=null;
String tslxbm=null;
String tsxlbm=null;
String ldyqjjsj=null;
String ldclyj=null;
String ldclr=null;
String ldclsj=null;


Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_khxx.fgsbh,crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.zrbmclzt,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,clzt,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
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

	ls_sql="select crm_tsbm.dwbh,dwmc,tslxbm,tsxlbm,ldyqjjsj,ldclyj,ldclr,ldclsj";
	ls_sql+=" from  crm_tsbm,sq_dwxx";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"' and crm_tsbm.tsyybm='"+tsyybm+"'";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zrbm=cf.fillNull(rs.getString("dwbh"));
		cldwmc=cf.fillNull(rs.getString("dwmc"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		ldclyj=cf.fillHtml(rs.getString("ldclyj"));
		ldclr=cf.fillHtml(rs.getString("ldclr"));
		ldclsj=cf.fillHtml(rs.getDate("ldclsj"));
	}
	rs.close();

%>

<html>
<head>
<title>����Ͷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">����Ͷ�ߣ�Ͷ�߼�¼�ţ�<%=tsjlh%>�� </div>

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">�ͻ����</font>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">��ͬ��</font>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"><font color="#0000CC">�ͻ�����</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">ǩԼ����</font></td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
    <td align="right"><font color="#0000CC">�绰</font></td>
    <td><%=lxfs%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">���ʦ</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">�ʼ�Ա</font>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">ʩ����</font>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">ʩ������</font>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC">�ƻ���������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000CC">�ƻ���������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">ʵ��������</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���س̶�</td>
    <td><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td align="right">����״̬</td>
    <td><%
	cf.selectToken(out,"0+δ����&1+������&2+�ڴ���&3+�᰸&9+������",clzt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�Ͷ��ʱ��</td>
    <td><%=tsbxsj%></td>
    <td align="right">Ͷ����Դ</td>
    <td><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�Ƿ���ط�</td>
    <td><%
	cf.selectToken(out,"Y+��ط�&N+����ط�",sfxhf,true);
%></td>
    <td align="right">�ط�ʱ��</td>
    <td><%=hfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=slr%></td>
    <td align="right">����ʱ��</td>
    <td><%=slsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<BR>
<div align="center">
<table width="94%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="32%" bgcolor="#FFFFCC" ><%=tsnr%>  </td>
  </tr>
</table>
</div>

<BR>
	<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
	  <tr bgcolor="#999999" align="center"> 
		<td width="10%">�漰����</td>
		<td width="20%">ԭ��</td>
		<td width="8%">����״̬</td>
		<td width="49%">�������</td>
		<td width="8%">����ʱ��</td>
		<td width="6%">������</td>
	  </tr>
<%
	
	String tsbm=null;
	String tsxlmc=null;
	String tsyymc=null;
	String bmclzt=null;
	String jjfa=null;
	String jssj=null;
	String jsr=null;

	ls_sql="select dwmc,tsxlmc,tsyymc,DECODE(crm_tsbm.clzt,'1','δ����','2','���պ�ֱ�ӳ������������','4','���պ�ֱ�ӳ����������','6','�ѽ��յȴ�������','7','�ȴ����ֳ��������','8','�ѳ��ֳ������������','9','�ѳ��ֳ����������','3','�ѽ��','5','�᰸') clzt,crm_tsbm.jjfa,crm_tsbm.jssj,crm_tsbm.jsr";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		tsbm=cf.fillNull(rs.getString("dwmc"));
		tsxlmc=cf.fillNull(rs.getString("tsxlmc"));
		tsyymc=cf.fillNull(rs.getString("tsyymc"));
		bmclzt=cf.fillNull(rs.getString("clzt"));
		jjfa=cf.fillHtml(rs.getString("jjfa"));
		jssj=cf.fillHtml(rs.getDate("jssj"));
		jsr=cf.fillHtml(rs.getString("jsr"));

		%>
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=tsbm%></td>
			<td align="left">(<%=tsxlmc%>)<%=tsyymc%></td>
			<td><%=bmclzt%></td>
			<td align="left"><%=jjfa%></td>
			<td><%=jssj%></td>
			<td><%=jsr%></td>
		  </tr>
		<%
	}
	rs.close();
%> 
</table>

<BR>
<%
	int hfcs=0;	
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hfcs=rs.getInt(1);
	}
	rs.close();

	if (hfcs>0)
	{
		%>
		<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
		  <tr bgcolor="#999999" align="center"> 
			<td width="10%">�ط�ʱ��</td>
			<td width="62%">�ͻ��ط����</td>
			<td width="28%">�ط��г��ֵ�������</td>
		  </tr>
		<%
		String khhfqk=null;
		String cxxwt=null;

		ls_sql="select hfsj,khhfqk,cxxwt";
		ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
		ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
		rs =stmt.executeQuery(ls_sql);
		while (rs.next())
		{
			khhfqk=cf.fillNull(rs.getString("khhfqk"));
			cxxwt=cf.fillNull(rs.getString("cxxwt"));
			hfsj=cf.fillNull(rs.getDate("hfsj"));
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" ><%=hfsj%></td>
				<td ><%=khhfqk%></td>
				<td ><%=cxxwt%></td>
			  </tr>
			<%
		}
		rs.close();
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>


<form method="post" action="SaveJsCrm_tsbm.jsp" name="editform">
        <div align="center"><b>��<%=cldwmc%>������Ͷ��</b></div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">Ͷ�ߴ���</font></td>
      <td width="32%"> 
        <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tslxbm='"+tslxbm+"'",tslxbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">Ͷ��С��</font></td>
      <td width="33%"> 
        <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tsxlbm='"+tsxlbm+"'",tsxlbm);
%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">Ͷ��ԭ��</font></td>
      <td width="32%"><select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%>
      </select></td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr>
      <td align="right">�ͻ�Ҫ����ʱ��</td>
      <td><%=yqjjsj%></td>
      <td align="right">�쵼Ҫ����ʱ��</td>
      <td><%=ldyqjjsj%></td>
    </tr>
    <tr>
      <td align="right">�쵼�������</td>
      <td colspan="3"><%=ldclyj%></td>
    </tr>
    <tr>
      <td align="right">�쵼������</td>
      <td><%=ldclr%></td>
      <td align="right">�쵼����ʱ��</td>
      <td><%=ldclsj%></td>
    </tr>
    
    <tr>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">����ʱ��</font></td>
      <td><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>����˵��</td>
      <td colspan="3"><textarea name="jssm" cols="87" rows="5" ></textarea></td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>����ƻ�</td>
      <td colspan="3">
		<input type="radio" name="clzt" value="2" onClick="jhfa.style.display='block';sjfa.style.display='none';jhjj.style.display='block';fanr.style.display='none';fash.style.display='none'">�ѽ��գ��ȴ�������<BR>
		<INPUT type="radio" name="clzt" value="4" onClick="jhfa.style.display='none';sjfa.style.display='block';jhjj.style.display='block';fanr.style.display='block';fash.style.display='none'">�ѳ������������������<BR>
		<INPUT type="radio" name="clzt" value="6" onClick="jhfa.style.display='none';sjfa.style.display='block';jhjj.style.display='block';fanr.style.display='block';fash.style.display='block'">�ѳ����������������</td>
    </tr>
    
    <tr id="jhfa" style="display:none">
      <td align="right"><font color="#FF0000">*</font>�ƻ�������ʱ��</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr id="sjfa" style="display:none">
      <td align="right"><font color="#FF0000">*</font>ʵ�ʳ�����ʱ��</td>
      <td><input type="text" name="sjcfasj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr id="jhjj" style="display:none">
      <td align="right"><font color="#FF0000">*</font>�ƻ����ʱ��</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr id="fash" style="display:none">
      <td align="right"><font color="#FF0000">*</font>������˲���</td>
      <td><select name="fashbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getZrbm(editform)">
        <option value=""></option>
        <%
	String sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh";
	cf.selectItem(out,sql,"");
%>
      </select></td>
      <td align="right"><font color="#FF0000">*</font>���������</td>
      <td><select name="fashr" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
      </select></td>
    </tr>
    
    <tr id="fanr" style="display:none">
      <td width="18%" align="right"><font color="#FF0000">*</font>�������</td>
      <td colspan="3"> 
        <textarea name="jjfa" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <div align="center"> 
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
        <input type="hidden" name="zrbm" value="<%=zrbm%>" >      
          <input type="button"  value="����" onClick="f_do(editform)" >
      <input type="reset"  value="����" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

function getZrbm(FormName)
{
	if (FormName.fashbm.value=='')
	{
		return;
	}

	FormName.fashr.length=1;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.fashbm.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
	openAjax(actionStr);

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.fashr,ajaxRetStr);
}





function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsr)=="") {
		alert("������[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("������[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jssm)=="") {
		alert("������[����˵��]��");
		FormName.jssm.focus();
		return false;
	}
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[����ƻ�]��");
		FormName.clzt[0].focus();
		return false;
	}

	if (FormName.clzt[0].checked)
	{
		if(	javaTrim(FormName.jhcfasj)=="") {
			alert("������[�ƻ�������ʱ��]��");
			FormName.jhcfasj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhcfasj, "�ƻ�������ʱ��"))) {
			return false;
		}

		if(	javaTrim(FormName.jhjjsj)=="") {
			alert("������[�ƻ����ʱ��]��");
			FormName.jhjjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
			return false;
		}

		FormName.sjcfasj.value="";
		FormName.fashbm.value="";
		FormName.fashr.value="";
		FormName.jjfa.value="";

	}
	else if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.sjcfasj)=="") {
			alert("������[ʵ�ʳ�����ʱ��]��");
			FormName.sjcfasj.focus();
			return false;
		}
		if(!(isDatetime(FormName.sjcfasj, "ʵ�ʳ�����ʱ��"))) {
			return false;
		}

		if(	javaTrim(FormName.jhjjsj)=="") {
			alert("������[�ƻ����ʱ��]��");
			FormName.jhjjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
			return false;
		}

		if(	javaTrim(FormName.jjfa)=="") {
			alert("��ѡ��[�������]��");
			FormName.jjfa.focus();
			return false;
		}

		FormName.jhcfasj.value="";
		FormName.fashbm.value="";
		FormName.fashr.value="";
	}
	else if (FormName.clzt[2].checked)
	{
		if(	javaTrim(FormName.sjcfasj)=="") {
			alert("������[ʵ�ʳ�����ʱ��]��");
			FormName.sjcfasj.focus();
			return false;
		}
		if(!(isDatetime(FormName.sjcfasj, "ʵ�ʳ�����ʱ��"))) {
			return false;
		}

		if(	javaTrim(FormName.jhjjsj)=="") {
			alert("������[�ƻ����ʱ��]��");
			FormName.jhjjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.fashbm)=="") {
			alert("������[������˲���]��");
			FormName.fashbm.focus();
			return false;
		}
		if(	javaTrim(FormName.fashr)=="") {
			alert("������[���������]��");
			FormName.fashr.focus();
			return false;
		}

		if(	javaTrim(FormName.jjfa)=="") {
			alert("��ѡ��[�������]��");
			FormName.jjfa.focus();
			return false;
		}

		FormName.jhcfasj.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
