<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ʩ����</title>
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

String shzzb=null;
String sgdyxj=null;
String ssfgs=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sgd=null;

String kpjlh=null;
String pdclzt=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,sgd,pdclzt,kgsjqd,DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
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
		sgd=cf.fillNull(rs.getString("sgd"));
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

	if (pdclzt.equals("5") || pdclzt.equals("6"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
		ls_sql="select shzzb,sgdyxj";
		ls_sql+=" from  pd_pdjl";
		ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shzzb=cf.fillNull(rs.getString("shzzb"));
			sgdyxj=cf.fillNull(rs.getString("sgdyxj"));
		}
		else{
			out.println("���󣡲����ڵ��ɵ���¼");
			return;
		}
		rs.close();
		ps.close();
	}
	else if (pdclzt.equals("8"))//5�������ɵ���6����Ȩ�ɵ���8����ʩ����
	{
	}
	else{
		out.println("�����ɵ�״̬����ȷ");
		return;
	}

	//ע�⣺���ܴ��ɵ���¼��pd_pdjl����ȡ��������¼�š��������ѵ��µĿ�������
	int kxsgds=0;
	ls_sql="select kpjlh,kxsgds";
	ls_sql+=" from  kp_pdkpjl ";
	ls_sql+=" where  fgsbh='"+ssfgs+"' and zxbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kpjlh=rs.getString("kpjlh");
		kxsgds=rs.getInt("kxsgds");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXgCrm_khxx.jsp" name="insertform" target="_blank">

<%


//ʣ�൥�ܶ�>��ǩԼ��
//ʣ������ĵ���>��ǩԼ���:��>��ǩԼ��е������󵥣��е���>��ǩԼ��
//�п��а���
//���ڽӵ��ܶ�>0
//������>0
//����ֱ���ӡ�Ƿ���ʡ�ʩ���Ӽ������������������

/*
�ܶ�ܳ�
ʣ�൥�ܶ� >= ǩԼ��

�󵥣����̼���󵥶�
syddje>=qye and sydze>=qye  
��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� >= ǩԼ�

��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� < ǩԼ� and ��(ʣ��󵥽�ʣ���е����) >= ǩԼ�

��ʣ�൥�ܶ�>=ǩԼ� and ��ʣ��󵥽�� < ǩԼ� and ��(ʣ��󵥽�ʣ���е����) < ǩԼ�

0<syddje<qye and (syddje+syzdje)>=qye and sydze>=qye  ���̣�����󵥶���ּ����е�
0<syddje<qye and (syddje+syzdje)<qye and sydze>=qye  ���̣�����󵥶���ּ����е���С��
syddje��0 and syzdje>=qye and sydze>=qye  ���̣�����󵥶�
syddje��0 and syzdje<qye and sydze>=qye  ���̣�����󵥶�

ʣ�൥�ܶ� < ǩԼ������ɵ�����ʼ�µ��ɵ�����
*/

	String c2=null;
	String hxsgd=null;
	String sgdmc=null;
	String kjdsm=null;
	String duihao=null;
	String sgdlx=null;
	double qdl=0;
	String sgdjbbm=null;
	int bqpm=0;
	double bzkxl=0;
	double syddje=0;
	double syzdje=0;
	double syxdje=0;
	String hxsgdstr="";

	ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
	ls_sql+=" from (";

	ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
	ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
	ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
	ls_sql+=" from kp_pdkpmx,sq_sgd";
	ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

	//��Ҫ������
	ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 ";
	ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

	ls_sql+=" order by kp_pdkpmx.sgdlx desc,sgdmc,qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

	ls_sql+=" )";
//	out.println(ls_sql);


	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hxsgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		kjdsm=cf.fillNull(rs.getString("kjdsm"));
		duihao=cf.fillNull(rs.getString("duihao"));
		sgdlx=cf.fillNull(rs.getString("sgdlx"));
		qdl=rs.getDouble("qdl");
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		bqpm=rs.getInt("bqpm");
		bzkxl=rs.getDouble("bzkxl");
		syddje=rs.getDouble("syddje");
		syzdje=rs.getDouble("syzdje");
		syxdje=rs.getDouble("syxdje");

		c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

		hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

	}
	rs.close();
	ps.close();
%>
  
  
  <div align="center">��ʩ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> </font></td>
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">��ͬ��</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> </font></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF" align="right">�ͻ�����</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>��<%=lxfs%>��</font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">�Ƿ��װ</font></td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF" align="right">����</td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right">С��</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%> </font></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF" align="right">���ݵ�ַ</td>
      <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF" align="right">ǩ������</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
      <td width="17%" bgcolor="#FFFFFF" align="right">���ʦ</td>
      <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%></font></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> </font></td>
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">¼��ʱ��</div>
      </td>
      <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> </font></td>
    </tr>
    <tr> 
      <td width="17%" align="right" bgcolor="#FFFFFF">��ע</td>
      <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="23"><font color="#000000"></font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="17%" align="right">�ɵ�����״̬</td>
      <td width="33%"><%
	cf.selectToken(out,"1+�����ɵ�&2+�˹��ɵ�&5+�����ɵ�&6+��Ȩ�ɵ�&7+�ܵ�&8+��ʩ����&4+�����޸��ɵ�",pdclzt,false);
%></td>
      <td width="17%" align="right">�ɵ�����</td>
      <td width="33%"><%
	cf.selectToken(out,"0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������&8+�����ɵ�&9+ͬС���ɵ�",jlbz,false);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">�ɵ���</div>
      </td>
      <td width="33%"> <%=pdr%> </td>
      <td width="17%"> 
        <div align="right">�ɵ�ʱ��</div>
      </td>
      <td width="33%"> <%=pdsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right">�Ƿ�ռ�ɵ�ָ��</td>
      <td width="33%"><%
	cf.radioToken(out,"Y+ռָ��&N+��ռָ��",shzzb,true);
%> </td>
      <td width="17%" align="right">�ɵ����ȼ�</td>
      <td width="33%"><%=sgdyxj%></td>
    </tr>
    <tr> 
      <td width="17%" bgcolor="#FFFFFF"> 
        <div align="right">�ɵ�˵��</div>
      </td>
      <td colspan="3" bgcolor="#FFFFFF"> <%=pdsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
      <td align="right" width="17%">�ʼ�</td>
      <td width="33%"><%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="25">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">ԭʩ����</font></td>
      <td width="33%"> 
        <select name="oldsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"' ",sgd);
%> 
        </select>
      </td>
      <td align="right" width="17%"><font color="#0000CC">ԭʩ���೤</font></td>
      <td width="33%"> 
        <input type="text" name="oldsgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��<font color="#0000CC">ԭʩ����</font>�ɵ�ָ��ٷֱ�</td>
      <td width="33%"> 
        <input type="text" name="oldkzbbfb" value="" size="10" maxlength="10" >
        %��0��100֮�䣩 </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>��<font color="#0000CC">��ʩ����</font>�ɵ�ָ��ٷֱ�</td>
      <td width="33%"> 
        <input type="text" name="newkzbbfb" value="" size="10" maxlength="10" >
        %��0��100֮�䣩 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ʩ����</td>
      <td colspan="3"> 
        <select name="newsgd" style="FONT-SIZE:12PX;WIDTH:523PX" onChange="changeSgd(insertform)" >
          <option value=""></option>
          <%=hxsgdstr%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ʩ���೤</td>
      <td width="33%"> 
        <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
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
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��ʩ����˵��</td>
      <td colspan="3"> 
        <textarea name="hsgdyy" cols="72" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="hidden" name="kpjlh" value="<%=kpjlh%>" >
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
function changeSgd(FormName)
{
	if (FormName.newsgd.value=='')
	{
		return;
	}

	FormName.sgbz.options.length=1;

	var str="SgdCx.jsp?sgd="+FormName.newsgd.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addItem(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	insertform.sgbz.add(op1);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}


	if(	javaTrim(FormName.oldkzbbfb)=="") {
		alert("��ѡ��[��ԭʩ�����ɵ�ָ��ٷֱ�]��");
		FormName.oldkzbbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.oldkzbbfb, "��ԭʩ�����ɵ�ָ��ٷֱ�"))) {
		return false;
	}
	if (FormName.oldkzbbfb.value<0 || FormName.oldkzbbfb.value>100)
	{
		alert("����[��ԭʩ�����ɵ�ָ��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.oldkzbbfb.select();
		return false;
	}

	if(	javaTrim(FormName.newkzbbfb)=="") {
		alert("��ѡ��[����ʩ�����ɵ�ָ��ٷֱ�]��");
		FormName.newkzbbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.newkzbbfb, "����ʩ�����ɵ�ָ��ٷֱ�"))) {
		return false;
	}
	if (FormName.newkzbbfb.value<0 || FormName.newkzbbfb.value>100)
	{
		alert("����[����ʩ�����ɵ�ָ��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.newkzbbfb.select();
		return false;
	}


	if(	javaTrim(FormName.newsgd)=="") {
		alert("��ѡ��[��ʩ����]��");
		FormName.newsgd.focus();
		return false;
	}
	if(	FormName.oldsgd.value==FormName.newsgd.value) {
		alert("[ԭʩ����]��[��ʩ����]����һ�£�");
		FormName.newsgd.focus();
		return false;
	}

	if(	javaTrim(FormName.hsgdyy)=="") {
		alert("������[��ʩ����ԭ��]��");
		FormName.hsgdyy.focus();
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
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
