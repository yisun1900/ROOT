<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jlh=cf.GB2Uni(request.getParameter("jlh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String zxdm=null;
String sjs=null;
String ssfgs=null;

String lfbz=null;
String lfsj=null;
String ctbz=null;
String ctsj=null;
String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;

String zxzt=null;
String sbyymc=null;
String sbyyxs=null;
String sbsj=null;

String yqghdm=null;
String yqghsjs=null;
String sjszysp=null;
String sjsgtnl=null;
String sjsfw=null;
String qtryfw=null;
String gcbj=null;
String gsztyx=null;
String xwgjfm=null;
String yzxxbz=null;
String qtdh=null;
String email=null;
String yylfsj=null;
String xclfsj=null;
int hfcs=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
try {
	conn=cf.getConnection();

	//�طü�¼��
	ls_sql="select NVL(max(substr(hfjlh,8,2)),0)";
	ls_sql+=" from  crm_zxhfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	hfcs++;
	
	hfjlh=khbh+cf.addZero(hfcs,2);

	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxhfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	hfcs++;
	
	ls_sql="select xclfsj,yylfsj,cxgtbz,cxgtsj,csgtbz,csgtsj,email,qtdh,yzxxbz,yqghdm,yqghsjs,sjszysp,sjsgtnl,sjsfw,qtryfw,gcbj,gsztyx,xwgjfm,lfbz,ctbz,lfsj,ctsj,khxm,fwdz,lxfs,zxdm,sjs,ssfgs,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zxzt,sbyymc,sbyyxs,sbsj";
	ls_sql+=" from  crm_zxkhxx,dm_sbyybm";
	ls_sql+=" where (khbh='"+khbh+"' and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xclfsj=cf.fillNull(rs.getDate("xclfsj"));
		yylfsj=cf.fillNull(rs.getDate("yylfsj"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));

		email=cf.fillNull(rs.getString("email"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		yzxxbz=cf.fillNull(rs.getString("yzxxbz"));
		yqghdm=cf.fillNull(rs.getString("yqghdm"));
		yqghsjs=cf.fillNull(rs.getString("yqghsjs"));
		sjszysp=cf.fillNull(rs.getString("sjszysp"));
		sjsgtnl=cf.fillNull(rs.getString("sjsgtnl"));
		sjsfw=cf.fillNull(rs.getString("sjsfw"));
		qtryfw=cf.fillNull(rs.getString("qtryfw"));
		gcbj=cf.fillNull(rs.getString("gcbj"));
		gsztyx=cf.fillNull(rs.getString("gsztyx"));
		xwgjfm=cf.fillNull(rs.getString("xwgjfm"));

		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		lfbz=rs.getString("lfbz");
		ctbz=rs.getString("ctbz");

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		sbyymc=cf.fillNull(rs.getString("sbyymc"));
		sbyyxs=cf.fillNull(rs.getString("sbyyxs"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
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
<table width="100%" style='FONT-SIZE: 12px'>
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��ط���Ϣ���طü�¼�ţ�<%=hfjlh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center"> 
        <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px' bgcolor="#CCCCCC">
          <tr  align="center"> 
            <td width="6%">�طô���</td>
            <td width="9%">�ط�ʱ��</td>
            <td width="13%">�طò���</td>
            <td width="6%">�ط���</td>
            <td width="56%">�ͻ��ط����</td>
            <td width="10%">�Ƿ�����������</td>
          </TR>
          <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_zxhfjl.hfcs,crm_zxhfjl.hfsj,sq_dwxx.dwmc hfbm ,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,DECODE(crm_zxhfjl.clfs,'0','������','1','���ѵ���','2','�������ʦ')";
	ls_sql+=" FROM crm_zxhfjl,sq_dwxx";
    ls_sql+=" where crm_zxhfjl.khbh='"+khbh+"' and crm_zxhfjl.hfbm=sq_dwxx.dwbh(+)";
	ls_sql+=" order by crm_zxhfjl.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[4]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
        </table>
			
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��¼��</td>
	<td  width="6%">���Ŵ���</td>
	<td  width="7%">����ʱ��</td>
	<td  width="8%">����Ŀ��</td>
	<td  width="5%">�Ӵ���</td>
	<td  width="10%">�Ӵ��˲���</td>
	<td  width="57%">ʵ�ʽӴ����</td>
</tr>
<%
	ls_sql="SELECT crm_khsmjl.jlh,crm_khsmjl.lfcs,crm_khsmjl.smsj,crm_khsmjl.smmd,crm_khsmjl.jdr,a.dwmc jdrbm,crm_khsmjl.sjjdqk  ";
	ls_sql+=" FROM crm_zxkhxx,crm_khsmjl,sq_dwxx a ";
    ls_sql+=" where crm_khsmjl.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_khsmjl.jdrbm=a.dwbh(+) ";
    ls_sql+=" and crm_khsmjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_khsmjl.jlh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>		
	</table>
			
<form method="post" action="SaveInsertCrm_zxhfjlSm.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">�ͻ����</font></td>
              <td width="30%"> <%=khbh%> </td>
              <td width="17%" align="right"><font color="#0000CC">�ͻ�����</font></td>
              <td width="36%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">��ϵ��ʽ</font></td>
              <td colspan="3"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td width="30%"><%=fwdz%></td>
              <td width="17%" align="right"><font color="#0000CC">�����ʼ�</font></td>
              <td width="36%"><%=email%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">��ѯ����</font></td>
              <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%> </td>
              <td width="17%" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="36%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">��ѯ״̬</font></td>
              <td width="30%"><%=zxzt%></td>
              <td width="17%" align="right"><font color="#FF0000">�Ƿ��ѽ�����</font></td>
              <td width="36%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">�ƻ���ƽ��ͼʱ��</font></td>
              <td>&nbsp;</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">ʧ��ԭ��</font></td>
              <td width="30%"><%=sbyymc%></td>
              <td width="17%" align="right"><font color="#0000CC">ʧ��ʱ��</font></td>
              <td width="36%"><%=sbsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">ʧ��ԭ������</font></td>
              <td colspan="3"><%=sbyyxs%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td colspan="4" align="center">�ͻ���������</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>��Ч��Ϣ��־</td>
              <td width="30%"><%
		cf.radioToken(out, "yzxxbz","Y+��Ч��Ϣ&N+��Ч��Ϣ",yzxxbz);
%></td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="36%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>������־</td>
              <td width="30%"><%
		cf.radioToken(out, "lfbz","N+δ����&Y+������",lfbz);
%></td>
              <td width="17%" align="right">����ʱ��</td>
              <td width="36%"> 
              <input type="text" name="lfsj" size="20" maxlength="20"  value="<%=lfsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>��ƽ��ͼ��־</td>
              <td width="30%"><%
		cf.radioToken(out, "ctbz","N+δ��ͼ&Y+�ѳ�ͼ",ctbz);
%></td>
              <td width="17%" align="right">��ƽ��ͼʱ��</td>
              <td width="36%"> 
              <input type="text" name="ctsj" size="20" maxlength="20"  value="<%=ctsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��Ч��ͼ��־</td>
              <td><%
		cf.radioToken(out, "cxgtbz","N+δ��ͼ&Y+�ѳ�ͼ",cxgtbz);
%></td>
              <td align="right">��Ч��ͼʱ��</td>
              <td><input type="text" name="cxgtsj" size="20" maxlength="20"  value="<%=cxgtsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>��ʩ��ͼ��־</td>
              <td><%
		cf.radioToken(out, "csgtbz","N+δ��ͼ&Y+�ѳ�ͼ",csgtbz);
%></td>
              <td align="right">��ʩ��ͼʱ��</td>
              <td><input type="text" name="csgtsj" size="20" maxlength="20"  value="<%=csgtsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4" align="center">�ط�ָ��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>��Ʒ����Ƿ�����</td>
              <td width="30%"> <%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='1' order by hfxmbm","sjszysp","");
%> </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>���ʦ��ͨ����</td>
              <td width="36%"><%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='2' order by hfxmbm","sjsgtnl","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>���ʦ����</td>
              <td><%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='3' order by hfxmbm","sjsfw","");
%></td>
              <td align="right"><font color="#CC0000">*</font>���̱���</td>
              <td><%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='4' order by hfxmbm","gcbj","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>������Ա����</td>
              <td width="30%"> <%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='5' order by hfxmbm","qtryfw","");
%> </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>�Թ�˾��ӡ��</td>
              <td width="36%"><%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='6' order by hfxmbm","gsztyx","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>ϣ���Ľ��ĵط�</td>
              <td colspan="3"><%
	cf.radioItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm where lx='7' order by hfxmbm","xwgjfm","");
%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4" align="center">�طý��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>�ط�����</td>
              <td><select name="zxkhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <OPTION  value=""></OPTION>
                  <%
		cf.selectItem(out,"select zxkhyxbm,zxkhyxmc from dm_zxkhyxbm order by zxkhyxbm","");
%>
              </select></td>
              <td align="right"><font color="#CC0000">*</font>�طô��� </td>
              <td>
				  <input type="text" name="hfcs" value="<%=hfcs%>" size="10" maxlength="10" readonly>��              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ԤԼ����ʱ��</td>
              <td><input type="text" name="yylfsj" value="<%=yylfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td align="right">ԤԼ����ʱ��</td>
              <td><input type="text" name="xclfsj" value="<%=xclfsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#CC0000">*</font>Ҫ���������</td>
              <td width="30%"> <%
		cf.radioToken(out, "yqghdm","N+��Ҫ��&Y+Ҫ�����",yqghdm);
%> </td>
              <td width="17%" rowspan="3" align="right">������Ա</td>
              <td width="36%" rowspan="3">
			    <select name="txry" size="5" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
                <OPTION  value=""></OPTION>
                <%
		cf.selectItem(out,"select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where ((dwbh='"+zxdm+"' and zwbm!='04') OR ( yhmc='"+sjs+"' and zwbm='04')) and sfzszg in('Y','N')  order by ssfgs,dwbh,yhmc","");
%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>Ҫ��������ʦ</td>
              <td><%
		cf.radioToken(out, "yqghsjs","N+��Ҫ��&Y+Ҫ�����",yqghsjs);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
              <font color="#CC0000">*</font>�Ƿ�����������              </td>
              <td width="30%">
                <input type="radio" name="clfs" value="0">
                ������ 
                <input type="radio" name="clfs" value="1">
                ���ѵ��� 
                <input type="radio" name="clfs" value="2">
              �������ʦ </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
              <font color="#CC0000">*</font><font color="#0000CC">�طò���</font>              </td>
              <td width="30%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
              </select>              </td>
              <td width="17%" align="right"> 
              <font color="#CC0000">*</font><font color="#0000CC">�ط���</font>              </td>
              <td width="36%"> 
              <input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
              <font color="#CC0000">*</font>�ͻ��ط����              </td>
              <td colspan="3"> 
                <textarea name="khhfqk" cols="84" rows="4"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                &nbsp;&nbsp;<A HREF="/dhzx/dhzx/ViewCrm_zxkhfwjl.jsp?khbh=<%=khbh%>" target="_blank"><B>�鿴�ͻ������¼</B></A> 
                &nbsp;&nbsp;<A HREF="/dhzx/dhzx/ViewCrm_sjsjdjl.jsp?khbh=<%=khbh%>" target="_blank"><B>�鿴���ʦ�ӵ���¼</B></A> 
                &nbsp;&nbsp;<A HREF="/dhzx/dhzx/ViewCrm_dmjdjl.jsp?khbh=<%=khbh%>" target="_blank"><B>�鿴����ӵ���¼</B></A> 
                &nbsp;&nbsp; <A HREF="/dhzx/zxqy/qdsbdj.jsp?khbh=<%=khbh%>"><B>ʧ�ܵǼ�</B></A> 
                <input type="hidden" name="jlh" value="<%=jlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.yzxxbz)) {
		alert("��ѡ��[��Ч��Ϣ��־]��");
		FormName.yzxxbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.lfbz)) {
		alert("��ѡ��[������־]��");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("������[����ʱ��]��");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}

	if(	!radioChecked(FormName.ctbz)) {
		alert("��ѡ��[��ƽ��ͼ��־]��");
		FormName.ctbz[0].focus();
		return false;
	}
	if (FormName.ctbz[1].checked)
	{
		if(	javaTrim(FormName.ctsj)=="") {
			alert("������[��ƽ��ͼʱ��]��");
			FormName.ctsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.ctsj, "��ƽ��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.ctsj.value="";
	}

	if(	!radioChecked(FormName.cxgtbz)) {
		alert("��ѡ��[��Ч��ͼ��־]��");
		FormName.cxgtbz[0].focus();
		return false;
	}
	if (FormName.cxgtbz[1].checked)
	{
		if(	javaTrim(FormName.cxgtsj)=="") {
			alert("������[��Ч��ͼʱ��]��");
			FormName.cxgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxgtsj, "��Ч��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.cxgtsj.value="";
	}
	if(	!radioChecked(FormName.csgtbz)) {
		alert("��ѡ��[��ʩ��ͼ��־]��");
		FormName.csgtbz[0].focus();
		return false;
	}
	if (FormName.csgtbz[1].checked)
	{
		if(	javaTrim(FormName.csgtsj)=="") {
			alert("������[��ʩ��ͼʱ��]��");
			FormName.csgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.csgtsj, "��ʩ��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.csgtsj.value="";
	}
	

	if(	!radioChecked(FormName.sjszysp)) {
		alert("��ѡ��[��Ʒ����Ƿ�����]��");
		FormName.sjszysp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjsgtnl)) {
		alert("��ѡ��[���ʦ��ͨ����]��");
		FormName.sjsgtnl[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sjsfw)) {
		alert("��ѡ��[���ʦ����]��");
		FormName.sjsfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.yqghdm)) {
		alert("��ѡ��[Ҫ���������]��");
		FormName.yqghdm[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.yqghsjs)) {
		alert("��ѡ��[Ҫ��������ʦ]��");
		FormName.yqghsjs[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.qtryfw)) {
		alert("��ѡ��[������Ա����]��");
		FormName.qtryfw[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.gcbj)) {
		alert("��ѡ��[���̱���]��");
		FormName.gcbj[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.gsztyx)) {
		alert("��ѡ��[��˾����ӡ��]��");
		FormName.gsztyx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.xwgjfm)) {
		alert("��ѡ��[ϣ���Ľ�����]��");
		FormName.xwgjfm[0].focus();
		return false;
	}


	if(	javaTrim(FormName.zxkhyxbm)=="") {
		alert("��ѡ��[�ط�����]��");
		FormName.zxkhyxbm.focus();
		return false;
	}
	if(!(isDatetime(FormName.yylfsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "ԤԼ����ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.clfs)) {
		alert("��ѡ��[�Ƿ�����������]��");
		FormName.clfs[0].focus();
		return false;
	}


	if(	javaTrim(FormName.hfbm)=="") {
		alert("��ѡ��[�طò���]��");
		FormName.hfbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hfr)=="") {
		alert("��ѡ��[�ط���]��");
		FormName.hfr.focus();
		return false;
	}

	if(	javaTrim(FormName.khhfqk)=="") {
		alert("��ѡ��[�ͻ��ط����]��");
		FormName.khhfqk.focus();
		return false;
	}
	if(!(isDatetime(FormName.yylfsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "�´�����ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
