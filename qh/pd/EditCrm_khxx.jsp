<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
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
String sgd=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
double qye=0;
double sjf=0;
double glf=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ybjfwdz="";
String ybjsjs="";
String ybjsgd="";
String ybjsgbz="";
String ybjzjxm="";

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

String deflbm=null;
String deflmc=null;
int kpjlh=0;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
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
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
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
		sgd=cf.fillNull(rs.getString("sgd"));
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

	if (sgd.equals(""))
	{
		sgd="0";
	}

	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'��'||sq_sgd.sgd||'��' sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  khbh='"+ybjbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ybjfwdz=cf.fillNull(rs.getString("fwdz"));
		ybjsjs=cf.fillNull(rs.getString("sjs"));
		ybjsgd=cf.fillNull(rs.getString("sgd"));
		ybjsgbz=cf.fillNull(rs.getString("sgbz"));
		ybjzjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();

	ls_sql="select NVL(max(kpjlh),0)";
	ls_sql+=" from  kp_kpjl ";
//	ls_sql+=" where  zxbz='Y' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=rs.getInt(1);
	}
	rs.close();

	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();

	//��
	ls_sql=" select deflbm,deflmc";
	ls_sql+=" from  crm_khxx,kp_dxdbm";
	ls_sql+=" where crm_khxx.fgsbh=kp_dxdbm.fgsbh and khbh='"+wherekhbh+"'";
	ls_sql+=" and qye>=dedy and qye<dexy";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		deflbm=rs.getString("deflbm");
		deflmc=rs.getString("deflmc");
	}
	rs.close();
	
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

String str1=cf.getItemData("select bzmc,bzmc||'��'||sq_bzxx.dh||'��',sq_bzxx.sgd from sq_bzxx,sq_sgd where sq_bzxx.sgd=sq_sgd.sgd and sq_sgd.ssfgs='"+ssfgs+"' order by sq_bzxx.sgd,sq_bzxx.bzmc ");

%>

<html>
<head>
<title>�ɵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ɵ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>��<%=lxfs%>��</font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>��<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>�� </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">����</font></td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">ÿƽ�׾���</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">�ι��������</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">������ַ</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">���ʦ</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">�ʼ�����</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">ʩ����</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">ʩ������</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">�ص���־</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,false);
%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#660066">�ص���</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#660066">�ص�װ�޵�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">������Ƿ���ʵ</td>
              <td width="31%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="18%" align="right">�ص��Ƿ���ʵ</td>
              <td width="32%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><font color="#000000"><b>��С��</b></font></td>
              <td width="31%"><font color="#000000"><b><%=deflmc%>��<%=jzbz%>��</b></font></td>
              <td width="18%" align="right"><font color="#000000"><b>����ǩԼ��</b></font></td>
              <td width="32%" bgcolor="#FFCCCC"><font color="#000000"><b><%=qye%></b></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>��Ʒ�</b></td>
              <td width="31%"><font color="#000000"><b><%=sjf%></b></font></td>
              <td width="18%" align="right"><b>�����</b></td>
              <td width="32%"><font color="#000000"><b><%=glf%></b></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b><font color="#0000FF">�ͻ�����</font></b></td>
              <td width="31%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="18%" align="right"><b>���齻������</b></td>
              <td width="32%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>��ͬ��������</b></td>
              <td width="31%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right"><b>��ͬ��������</b></td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">�ɵ�����</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getSgd(editform)">
                  <%
	cf.selectToken(out,"0+�����ɵ�&5+�󵥵�С��&6+С���ִ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������",jlbz);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">������֤��־</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"><%=kgzbz%> </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">�ɵ���</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">�ɵ�ʱ��</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">����ʩ����</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:500PX" onChange="selectItem(sgd,sgbz,<%=str1%>)" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��'||'��'||kjdsm||'��' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' OR (tdbz='Y' and (tdkssj>SYSDATE OR SYSDATE>tdzzsj)) ) order by sgdmc",sgd);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">ʩ���೤</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:180PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC" align="right">�ʼ�</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">�ɵ�˵��</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="55" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden"  name="kpjlh" value="<%=kpjlh%>">
                <input type="hidden"  name="fwdz" value="<%=fwdz%>">
                <input type="button"  value="����" onClick="f_do(editform)">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="��ʵ�ص�" onClick="window.open('/gcgl/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
                <%
}
if (ybjss.equals("0"))
{
%> 
                <input type="button"  value="��ʵ�����" onClick="window.open('/gcgl/hsybj/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="button">
                <%
}
%> 
                <input type="button"  value="ʩ�����ɵ�ͳ��" onClick="f_cksgd(editform)">
                <input type="button"  value="��ѯ������ʩ����" onClick="f_ckbz(editform)" >
                <input type="reset"  value="����">
                <input type="button"  value="��ӡ�ɹ���" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function getSgd(FormName)
{
/*
	if (FormName.jlbz.value=='')
	{
		return;
	}

	editform.sgd.options.length=1;

	var str="SgdCx.jsp?deflbm=<%=deflbm%>&sgd=<%=sgd%>&ssfgs=<%=ssfgs%>&kpjlh=<%=kpjlh%>&jlbz="+FormName.jlbz.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
*/
}

//getSgd(editform);

function addItem(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	editform.sgd.add(op1);
}

function chooseItem(str)
{
	editform.sgd.value=str;                                                                        
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jlbz)=="") {
		alert("������[�ɵ�����]��");
		FormName.jlbz.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("������[�ɵ�ʱ��]��");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_cksgd(FormName)//����FormName:Form������
{
	FormName.action="PdTjb.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_ckbz(FormName)//����FormName:Form������
{

	FormName.action="EnterFwdz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
