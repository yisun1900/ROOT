<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;
String dwbh=null;
String lrsj=null;
String pdsj=null;
String pdr=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
double sjf=0;
double glf=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String xqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;
String kgsjqd=null;
String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;

double qye=0;
String shzzb=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kgsjqd,DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		hth=cf.fillNull(rs.getString("hth"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		ybjssmc=cf.fillNull(rs.getString("ybjssmc"));
		hdsfssmc=cf.fillNull(rs.getString("hdsfssmc"));
	}
	rs.close();
	ps.close();

	long xuhao=0;
	ls_sql="select qye,shzzb,xuhao";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		shzzb=cf.fillNull(rs.getString("shzzb"));
		xuhao=rs.getLong("xuhao");
	}
	rs.close();
	ps.close();

	long maxxuhao=0;
	ls_sql="select max(xuhao)";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxxuhao=rs.getLong(1);
	}
	rs.close();
	ps.close();

	if (maxxuhao!=xuhao)
	{
		out.println("����ֻ���޸����µ��ɵ���¼��"+maxxuhao);
		return;
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertPd_sgdjdjl.jsp" name="insertform" target="_blank">
  <div align="center">ʩ���Ӿܵ���¼</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td width="20%" bgcolor="#FFFFFF"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="30%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> </font></td>
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">��ͬ��</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> </font></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF" align="right">�ͻ�����</td>
      <td width="30%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>��<%=lxfs%>��</font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">�Ƿ��װ</font></td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF" align="right">����</td>
      <td width="30%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right">С��</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%> </font></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF" align="right">���ݵ�ַ</td>
      <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF" align="right">ǩ������</td>
      <td width="30%" bgcolor="#FFFFFF"><font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right">���ʦ</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%></font></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="30%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> </font></td>
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">¼��ʱ��</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> </font></td>
    </tr>
    <tr> 
      <td width="20%" align="right" bgcolor="#FFFFFF">��ע</td>
      <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="23"><font color="#000000"></font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%"> 
        <div align="right">�ɵ���</div>
      </td>
      <td width="30%"> <%=pdr%> </td>
      <td width="17%"> 
        <div align="right">�ɵ�ʱ��</div>
      </td>
      <td width="33%"> <%=pdsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right">�ɵ�����</td>
      <td width="30%"> <%
	cf.selectToken(out,"1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������&9+ͬС���ɵ�",jlbz,false);
%> </td>
      <td width="17%" align="right">�Ƿ�ռ�ɵ�ָ��</td>
      <td width="33%"><%
	cf.radioToken(out,"Y+ռָ��&N+��ռָ��",shzzb,true);
%></td>
    </tr>
    <tr> 
      <td width="20%" bgcolor="#FFFFFF"> 
        <div align="right">�ɵ�˵��</div>
      </td>
      <td colspan="3" bgcolor="#FFFFFF"> <%=pdsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ʩ���೤</td>
      <td width="30%"><%=sgbz%> </td>
      <td align="right" width="17%">�ʼ�</td>
      <td width="33%"><%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="25">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">ʩ����</font></td>
      <td width="30%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"' ",sgd);
%> 
        </select>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>�ܵ��۳��ɵ�ָ�����</td>
      <td width="30%"> 
        <select name="kczbbl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="0">����ָ��</option>
          <option value="1">�۳������ɵ���</option>
          <option value="2">�۳�2���ɵ���</option>
          <option value="3">�۳�3���ɵ���</option>
        </select>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
      <td width="33%">
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="30%"> 
        <input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="33%"> 
        <input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#CC0000">*</font>�ܵ�ԭ��</td>
      <td colspan="3"> 
        <textarea name="jjyy" cols="69" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.kczbbl)=="") {
		alert("��ѡ��[�ܵ��۳��ɵ�ָ�����]��");
		FormName.kczbbl.focus();
		return false;
	}
	if(	javaTrim(FormName.jjyy)=="") {
		alert("������[�ܵ�ԭ��]��");
		FormName.jjyy.focus();
		return false;
	}

	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.hfr)=="") {
		alert("������[¼����]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[¼�벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
