<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
%>
<%
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String ywyssxz=null;
String xqlx=null;
String fwmj=null;
String hxbm=null;
String fj=null;
String khzyxz=null;
String yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
String xchfsj=null;
String dqbm=null;
String jlh=null;
String zjgzsj=null;

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select crm_scbkhxx.zjgzsj,khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,lrr,lrsj,lrbm,crm_scbkhxx.ssfgs,crm_scbkhxx.bz,cqmc,jiedao,xqbm,louhao,dwmc ywyssxz,xqlx,fwmj,hxmc,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" from  crm_scbkhxx,dm_hxbm,sq_dwxx,dm_cqbm";
	ls_sql+=" where  crm_scbkhxx.hxbm=dm_hxbm.hxbm(+) and scbkhbh='"+scbkhbh+"'";
	ls_sql+=" and crm_scbkhxx.ywyssxz=sq_dwxx.dwbh(+) and crm_scbkhxx.cqbm=dm_cqbm.cqbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjgzsj=cf.fillNull(rs.getDate("zjgzsj"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		cqbm=cf.fillNull(rs.getString("cqmc"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxbm=cf.fillNull(rs.getString("hxmc"));
		fj=cf.fillNull(rs.getString("fj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		jzdsmc=cf.fillNull(rs.getString("jzdsmc"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
	
	int count=0;
	ls_sql="select NVL(max(substr(jlh,8,3)),0)";
	ls_sql+=" from  crm_scbkhgzjl";
	ls_sql+=" where scbkhbh='"+scbkhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=scbkhbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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

<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
.STYLE1 {color: #FF0000}
-->
</style>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  target="_blank">
<div align="center">�г����ͻ����ټ�¼����¼�ţ�<%=jlh%>��</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��¼��</td>
	<td  width="10%">�ͻ�����</td>
	<td  width="7%">ԤԼ����ʱ��</td>
	<td  width="5%">�Ƿ���ط�</td>
	<td  width="7%">�´λط�ʱ��</td>
	<td  width="52%">����˵��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_scbkhgzjl.jlh,sckhyxmc,yyddsj,DECODE(crm_scbkhgzjl.sfxhf,'Y','��Ҫ','N','��'),crm_scbkhgzjl.xchfsj,crm_scbkhgzjl.gzsm,crm_scbkhgzjl.lrr,crm_scbkhgzjl.lrsj";
	ls_sql+=" FROM crm_scbkhgzjl,dm_sckhyxbm";
    ls_sql+=" where crm_scbkhgzjl.sckhyxbm=dm_sckhyxbm.sckhyxbm(+) ";
    ls_sql+=" and crm_scbkhgzjl.scbkhbh='"+scbkhbh+"'";
    ls_sql+=" order by crm_scbkhgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE2">״̬</span></td>
    <td><%
	cf.radioToken(out, "1+����&2+ʧ��&3+�ƽ�&4+�ѽ���&5+׼���ƽ�&6+׼��ʧ��&7+�ƽ�����",zt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��ϵ��ʽ</span></td>
    <td colspan="3"><%=lxfs%></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��������</span></td>
    <td><%=cqbm%></td>
    <td align="right"><span class="STYLE2">�ֵ�</span></td>
    <td><%=jiedao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С��</span></td>
    <td><%=xqbm%></td>
    <td align="right"><span class="STYLE2">¥��</span></td>
    <td><%=louhao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">���ݵ�ַ</span></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С������</span></td>
    <td><%=xqlx%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=hxbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�������</span></td>
    <td><%=fwmj%></td>
    <td align="right"><span class="STYLE2">���ۣ�Ԫ/m��</span></td>
    <td><%=fj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ���Դ����</span></td>
    <td><%=khzyxz%></td>
    <td align="right"><span class="STYLE2">Ԥ��װ��ʱ��</span></td>
    <td><%=yjzxsj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�Ƿ���ط�</span></td>
    <td><%
	cf.radioToken(out,"Y+��Ҫ&N+��",sfxhf,true);
%>    </td>
    <td align="right"><span class="STYLE2">�´λط�ʱ��</span></td>
    <td><%=xchfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">������������</span></td>
    <td><%=jzdsmc%></td>
    <td align="right"><span class="STYLE2">�������ʱ��</span></td>
    <td><%=zjgzsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">ҵ��Ա</span></td>
    <td><%=ywy%> </td>
    <td align="right"><span class="STYLE2">ҵ��Ա����С��</span></td>
    <td><%=ywyssxz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">¼����</span></td>
    <td><%=lrr%></td>
    <td align="right"><span class="STYLE2">¼��ʱ��</span></td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">¼�벿��</span></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>    </td>
    <td align="right"><span class="STYLE2">�����ֹ�˾</span></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��ע</span></td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#999999">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ͻ�����</td>
  <td>
  <select name="sckhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	 <OPTION  value=""></OPTION>
  <%
	cf.selectItem(out,"select sckhyxbm,sckhyxmc from dm_sckhyxbm order by sckhyxbm","");
%>
</select></td>
  <td align="right">ԤԼ�ͻ�����ʱ��</td>
  <td>
	  <input type="text" name="yyddsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�Ƿ���ط�</td>
  <td><%
	cf.radioToken(out, "sfxhf","Y+��Ҫ&N+��","");
%>  </td>
  <td align="right">�´λط�ʱ��</td>
  <td><input type="text" name="xchfsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����˵��</td>
  <td colspan="3"><textarea name="gzsm" cols="72" rows="6"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <input type="hidden" name="jlh" value="<%=jlh%>" >
	    <input type="hidden" name="scbkhbh" value="<%=scbkhbh%>" >
	    <input type="button"  value="����" onClick="f_do(insertform)">
	    <input type="button" onClick="f_sbdj(insertform)"  value="ʧ�ܵǼ�">
	    <input type="button" onClick="f_yj(insertform)"  value="�ƽ�">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("������[�г����ͻ����]��");
		FormName.scbkhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sckhyxbm)=="") {
		alert("������[�ͻ�����]��");
		FormName.sckhyxbm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yyddsj, "ԤԼ�ͻ�����ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.xchfsj)=="") {
			alert("������[�´λط�ʱ��]��");
			FormName.xchfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfsj, "�´λط�ʱ��"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xchfsj)!="") {
			alert("��������[�´λط�ʱ��]��");
			FormName.xchfsj.select();
			return false;
		}
	}
	if(	javaTrim(FormName.gzsm)=="") {
		alert("������[����˵��]��");
		FormName.gzsm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveInsertCrm_scbkhgzjl.jsp";
	FormName.submit();
	return true;
}

function f_sbdj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("������[�г����ͻ����]��");
		FormName.scbkhbh.focus();
		return false;
	}

	FormName.target="";
	FormName.action="DjCrm_scbkhxx.jsp";
	FormName.submit();
	return true;
}

function f_yj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("������[�г����ͻ����]��");
		FormName.scbkhbh.focus();
		return false;
	}

	FormName.target="";
	FormName.action="YjCrm_scbkhxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
