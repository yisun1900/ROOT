<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Ͷ�߳��ֳ�</title>
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
	out.print("����ʧ��,��������: " + e);
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
  <div align="center">Ͷ�߳��ֳ���<font color="#0033CC">�����¼�ţ�<%=kcjlh%></font>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ͻ����</font> </td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">��ͬ��</font> </td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ͻ�����</font></td>
      <td><%=khxm%></td>
      <td align="right"><font color="#0000CC">ǩԼ����</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
      <td><%=fwdz%></td>
      <td align="right"><font color="#0000CC">�绰</font></td>
      <td><%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">���ʦ</font> </td>
      <td><%=sjs%> </td>
      <td align="right"><font color="#0000CC">�ʼ�Ա</font> </td>
      <td><%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">ʩ����</font> </td>
      <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>      </td>
      <td align="right"><font color="#0000CC">ʩ������</font> </td>
      <td><%=sgbz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">�ƻ���������</font></td>
      <td><%=kgrq%> </td>
      <td align="right"><font color="#0000CC">�ƻ���������</font></td>
      <td><%=jgrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">ʵ��������</font></td>
      <td><%=sjkgrq%> </td>
      <td align="right"><font color="#0000CC">ʵ��������</font></td>
      <td><%=sjjgrq%> </td>
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
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">Ͷ�߼�¼��</font></td>
      <td width="32%"> 
        <input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="9" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">Ͷ��ԭ��</font></td>
      <td width="31%"><select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ͻ�Ҫ����ʱ��</td>
      <td><%=yqjjsj%></td>
      <td align="right">�쵼Ҫ����ʱ��</td>
      <td><%=ldyqjjsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�쵼�������</td>
      <td colspan="3"><%=ldclyj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�쵼������</td>
      <td><%=ldclr%></td>
      <td align="right">�쵼����ʱ��</td>
      <td><%=ldclsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>���ֳ����</td>
      <td colspan="3"> 
        <textarea name="xcqk" cols="71" rows="9"></textarea>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><font color="#0000CC">�ƻ����ֳ�ʱ��</font></td>
      <td><input type="text" name="jhcxcsj" value="<%=jhcxcsj%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>������</td>
      <td width="32%"> 
        <input type="text" name="kcr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>ʵ�ʳ��ֳ�ʱ��</td>
      <td width="31%"> 
        <input type="text" name="kcsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�����Ƿ������</td>
      <td colspan="3"><INPUT type="radio" name="clzt" value="8" onClick="fash.style.display='none';fanr.style.display='block'">
        �������������������<BR>
        <INPUT type="radio" name="clzt" value="9" onClick="fash.style.display='block';fanr.style.display='block'">
      �����������������<BR>
        <INPUT type="radio" name="clzt" value="A" onClick="fash.style.display='block';fanr.style.display='none'">
      �ѳ��ֳ��ȴ�����<BR>
        <INPUT type="radio" name="clzt" value="3" onClick="fash.style.display='block'">
      �ѽ��	  </td>
    </tr>
    
    <tr bgcolor="#FFFFFF" >
      <td align="right"><font color="#FF0000">*</font>�ƻ�������ʱ��</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" value="<%=jhcfasj%>" onDblClick="JSCalendar(this)"></td>
      <td align="right"><font color="#FF0000">*</font>�ƻ����ʱ��</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" value="<%=jhjjsj%>" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
      <td align="right"><font color="#FF0000">*</font>ʵ�ʳ�����ʱ��</td>
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
      <td align="right"><font color="#FF0000">*</font>ʵ�ʽ��ʱ��</td>
      <td><input type="text" name="sjjjsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF" id="fash" style="display:none">
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
    <tr  bgcolor="#FFFFFF" id="fanr" style="display:none">
      <td align="right"><font color="#FF0000">*</font>�������</td>
      <td colspan="3"><textarea name="jjfa" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr  bgcolor="#FFFFFF" id="fanr" style="display:none">
      <td align="right"><font color="#FF0000">*</font>���մ�����</td>
      <td colspan="3"><textarea name="zzcljg" cols="87" rows="10"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">¼����</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0033CC">¼��ʱ��</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0033CC">¼�벿��</font></td>
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
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="2"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="button"  value="�ϴ���Ƭ" onClick="f_lr(insertform)" name="lr" disabled>
        <input type="button"  value="�鿴��Ƭ" onClick="f_ck(insertform)" name="ck" disabled>
        <input type="reset"  value="����" name="reset">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[Ͷ�߱��޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("������[Ͷ��ԭ��]��");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("������[�����¼��]��");
		FormName.kcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.xcqk)=="") {
		alert("������[�ֳ����]��");
		FormName.xcqk.focus();
		return false;
	}
	if(	javaTrim(FormName.kcr)=="") {
		alert("������[������]��");
		FormName.kcr.focus();
		return false;
	}
	if(	javaTrim(FormName.kcsj)=="") {
		alert("������[����ʱ��]��");
		FormName.kcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kcsj, "����ʱ��"))) {
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

	FormName.action="SaveInsertCrm_tsbxxckcjl.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("������[�����¼��]��");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("������[�����¼��]��");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
