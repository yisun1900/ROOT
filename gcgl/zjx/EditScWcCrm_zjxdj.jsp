<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

double zjje=0;
double jzjje=0;
double zqzjxsuijin=0;
double zjxsuijin=0;
double zqguanlif=0;
double zhguanlif=0;

double kglf=0;
double kqtk=0;
String fssj=null;
String khbh=null;
String zjxfsjd=null;
String zjxyysm=null;


String fgsbh=null;
String kh_dwbh=null;
double kh_zjxje=0;
double kh_zhzjxje=0;
double kh_zqguanlif=0;
double kh_glfbfb=0;
double kh_guanlif=0;
double kh_zqzjxguanlif=0;
double kh_zjxguanlif=0;
double kh_suijin=0;
double kh_suijinbfb=0;
double kh_zjxsuijin=0;
double kh_kglf=0;
double kh_kqtk=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String kh_gcjdbm=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
double kh_zkl=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;


String zklx=null;

double zjxjme=0;
double glfjmje=0;
double sjjmje=0;


String dqbm=null;

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select zjje,jzjje,zqzjxsuijin,zjxsuijin,zqguanlif,zhguanlif,zjxjme,glfjmje,sjjmje ,kqtk,kglf,fssj,khbh,zjxfsjd,zjxyysm";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where crm_zjxdj.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");

		zjje=rs.getDouble("zjje");
		jzjje=rs.getDouble("jzjje");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zqguanlif=rs.getDouble("zqguanlif");
		zhguanlif=rs.getDouble("zhguanlif");

		kqtk=rs.getDouble("kqtk");
		kglf=rs.getDouble("kglf");
		fssj=cf.fillNull(rs.getDate("fssj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		zjxfsjd=cf.fillNull(rs.getString("zjxfsjd"));
		zjxyysm=cf.fillNull(rs.getString("zjxyysm"));
	}
	else{
		rs.close();
		ps.close();

		out.println("�����������¼������");
		return;
	}
	rs.close();
	ps.close();


	ls_sql="select fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,glfbfb,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,gcjdbm,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,zkl,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		kh_dwbh=cf.fillNull(rs.getString("dwbh"));
		kh_zjxje=rs.getDouble("zjxje");
		kh_zhzjxje=rs.getDouble("zhzjxje");
		kh_zqguanlif=rs.getDouble("zqguanlif");
		kh_guanlif=rs.getDouble("guanlif");
		kh_glfbfb=rs.getDouble("glfbfb");
		kh_zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		kh_zjxguanlif=rs.getDouble("zjxguanlif");

		kh_suijin=rs.getDouble("suijin");
		kh_suijinbfb=rs.getDouble("suijinbfb");
		kh_zjxsuijin=rs.getDouble("zjxsuijin");

		kh_kglf=rs.getDouble("kglf");
		kh_kqtk=rs.getDouble("kqtk");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		kh_sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		kh_gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		kh_gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_zkl=rs.getDouble("zkl");
		kh_hth=cf.fillNull(rs.getString("hth"));
		kh_khxm=cf.fillNull(rs.getString("khxm"));
		kh_lxfs=cf.fillNull(rs.getString("lxfs"));
		kh_sgd=cf.fillNull(rs.getString("sgd"));
		kh_sgbz=cf.fillNull(rs.getString("sgbz"));
		kh_fwdz=cf.fillNull(rs.getString("fwdz"));
		kh_sjs=cf.fillNull(rs.getString("sjs"));
		kh_jzbz=rs.getString("jzbz");
	}
	else{
		rs.close();
		ps.close();

		out.println("���󣡿ͻ�������");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+kh_dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	if (kh_gcjdbm.equals("5"))
	{
		out.println("���󣡿ͻ�����ᣬ�������޸�");
		return;
	}
	if (kh_sjsjsbz.equals("2"))//0��δ���㣻1��ǩ�����㣻2���깤����
	{
		out.println("�������ʦ�ѽ��㣬�������޸�");
		return;
	}
	if (kh_gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("����ʩ�����ѽ��㣬�������޸�");
		return;
	}

	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N��δ��ɣ�Y�������
	ls_sql+=" and lx in('1','2')";//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kh_zjxxh=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!kh_zjxxh.equals(zjxxh))
	{
		out.println("����ֻ���޸����µ��������¼:"+kh_zjxxh);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>���޸���������Ϣ����������ţ�<%=zjxxh%>��</p>
        <p><strong><font color="#0000CC">ע�⣺ˮ��Ԥ��Ҫ������</font></strong></p>
      </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000FF">��ͬ��</font>              </td>
              <td width="31%"> <%=kh_hth%> </td>
              <td width="21%" align="right"> 
                <font color="#0000CC">�ͻ�����</font>              </td>
              <td width="29%"> <%=kh_khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC">���ݵ�ַ</font>              </td>
              <td width="31%"><%=kh_fwdz%> </td>
              <td width="21%" align="right"> 
                <font color="#0000CC">���̵���</font>              </td>
              <td width="29%"><%=kh_zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">ǩԼ����</font></td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
              <td width="21%" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="29%"><%=kh_sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC">ʩ����</font>              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%> </td>
              <td width="21%" align="right"> 
                <font color="#0000CC">ʩ������</font>              </td>
              <td width="29%"> <%=kh_sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">����ԭ����</font></td>
              <td width="31%"><%=kh_wdzgce%></td>
              <td align="right" width="21%"><font color="#0000CC">����ǩԼ��</font></td>
              <td width="29%"><%=kh_qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">����������-��ǰ</font></td>
              <td width="31%"><%=kh_zjxje%></td>
              <td align="right" width="21%"><font color="#0000CC">����������-�ۺ�</font></td>
              <td width="29%"><%=kh_zhzjxje%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">��ͬ˰��</font></td>
              <td width="31%" height="2"><%=kh_suijin%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">������˰��</font></td>
              <td width="29%" height="2"><%=kh_zjxsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">��ͬ�����-��ǰ</font></td>
              <td width="31%" height="2"><%=kh_zqguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">��ͬ�����-�ۺ�</font></td>
              <td width="29%" height="2"><%=kh_guanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">���������-��ǰ</font></td>
              <td width="31%" height="2"><%=kh_zqzjxguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">���������-�ۺ�</font></td>
              <td width="29%" height="2"><%=kh_zjxguanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�ۼƼ�������</font></td>
              <td width="31%"><%=kh_kglf%></td>
              <td align="right" width="21%"><font color="#0000CC">�ۼƼ����������</font></td>
              <td width="29%"><%=kh_kqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�ۿ�����</font></td>
              <td width="31%"> <%
	cf.radioToken(out,"0+���ۿ�&1+ȫ���ۿ�&2+�����ۿ�",zklx,true);
%> </td>
              <td align="right" width="21%"><font color="#0000CC">��ͬ�ۿ�</font></td>
              <td width="29%"><font color="#0000CC"><%=kh_zkl%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�μӶ������</font></td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">�ۿ���Ʒ</font></td>
              <td colspan="3"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">��������</font></td>
              <td colspan="3"><%=cxhdbmzh%></td>
            </tr>
        </table>
    <BR>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
           <tr align="center" bgcolor="#FFFFFF">
             <td colspan="2" bgcolor="#E8E8FF"><strong>���̷�</strong></td>
             <td width="1%" rowspan="5" bgcolor="#000033">&nbsp;</td>
             <td colspan="2" bgcolor="#E8E8FF"><strong>�����</strong></td>
             <td width="1%" rowspan="5" bgcolor="#000033">&nbsp;</td>
             <td colspan="2" bgcolor="#E8E8FF"><strong>˰��</strong></td>
           </tr>
           <tr bgcolor="#FFFFFF">
             <td colspan="2" align="center" bgcolor="#FFFFFF"><font color="#CC0066"><strong>����Ϊ��������Ϊ��</strong></font></td>
             <td align="right"><font color="#0000CC">����Ѱٷֱ�</font></td>
             <td bgcolor="#FFFFFF"><%=kh_glfbfb%>%</td>
             <td width="15%" align="right"><font color="#0000CC">˰��ٷֱ�</font></td>
             <td width="17%"><font color="#0000CC"><%=kh_suijinbfb%>%</font></td>
           </tr>
           <tr bgcolor="#FFFFFF">
             <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������-��ǰ</font></td>
             <td><input type="text" name="zjje" value="<%=zjje%>" size="10" maxlength="17" ></td>
             <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������-��ǰ</font></td>
             <td bgcolor="#FFFFFF"><input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="10" maxlength="17"  readonly></td>
             <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������-��ǰ</font></td>
             <td><input type="text" name="zqzjxsuijin" value="<%=zqzjxsuijin%>" size="8" maxlength="17" readonly></td>
           </tr>
           <tr bgcolor="#FFFFFF">
             <td align="right"><font color="#FF0000">*</font>�����</td>
             <td><input type="text" name="zjxjme" size="10" maxlength="17" value="<%=zjxjme%>" ></td>
             <td align="right"><font color="#FF0000">*</font>�����</td>
             <td bgcolor="#FFFFFF"><input type="text" name="glfjmje" size="10" maxlength="17" value="<%=glfjmje%>" ></td>
             <td align="right"><font color="#FF0000">*</font>�����</td>
             <td><input type="text" name="sjjmje" size="8" maxlength="17" value="<%=sjjmje%>" ></td>
           </tr>
           <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000CC">������-�ۺ�</font></td>
             <td width="18%"><input type="text" name="jzjje" value="<%=jzjje%>" size="10" maxlength="17" readonly></td>
              <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000CC">������-�ۺ�</font></td>
             <td width="18%" bgcolor="#FFFFFF"><input type="text" name="zhguanlif" value="<%=zhguanlif%>" size="10" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������-�ۺ�</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="zjxsuijin" value="<%=zjxsuijin%>" size="8" maxlength="17" readonly></td>
          </tr>
        </table>
    <BR>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

                  <tr bgcolor="#FFFFFF">
                    <td align="right"><font color="#FF0000">*</font>�۹����</td>
                    <td><input type="text" name="kglf" value="<%=kglf%>" size="8" maxlength="17" >
                      <font color="#CC0066"><strong>Ϊ����</strong></font></td>
                    <td width="21%" align="right"><font color="#FF0000">*</font>��������</td>
                    <td width="29%"><input type="text" name="kqtk" value="<%=kqtk%>" size="8" maxlength="17" >
                      <font color="#CC0066"><strong>Ϊ����</strong></font></td>
                  </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right">��������׶�</td>
                  <td><select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                    <option value=""></option>
                    <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd",zjxfsjd);
%>
                  </select></td>
                  <td width="21%" rowspan="4" align="right"><font color="#FF0000">*</font>������ԭ��</td>
                  <td width="29%" rowspan="4"><select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                    <%
	cf.mutilSelectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","select zjxyybm from crm_zjxyydj where zjxxh='"+zjxxh+"'");
%>
                  </select></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right"><font color="#FF0000">*</font>�������ʱ��</td>
                  <td><input type="text" name="fssj" value="<%=fssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
                </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">¼����</font></td>
              <td width="31%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">¼��ʱ��</font></td>
              <td width="31%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������˵��              </td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="74" rows="3"><%=zjxyysm%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                  <input type="hidden" name="oldzjje" value="<%=zjje%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
                <input type="button"  value="ɾ�������" onClick="f_scwc(insertform)" name="scwc" >
                <input type="button"  value="Ԥ�����±���" onClick="f_dybj(insertform)" name="ck" >
                <input name="button" type="button" onClick="f_bgmx(insertform)"  value="�鿴�����Ϣ"  >              </td>
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
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("��ѡ��[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[�������ʱ��]��");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "�������ʱ��"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("������[������ԭ��]��");
		FormName.zjxyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.zjxjme)=="") {
		alert("������[���̷Ѽ����]��");
		FormName.zjxjme.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjme, "���̷Ѽ����"))) {
		return false;
	}
	if (FormName.zjxjme.value<0 || FormName.zjxjme.value>100)
	{
		alert("����[���̷Ѽ����]Ӧ����0��100֮�䣡");
		FormName.zjxjme.select();
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("������[����Ѽ����]��");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "����Ѽ����"))) {
		return false;
	}
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("����[����Ѽ����]Ӧ����0��100֮�䣡");
		FormName.glfjmje.select();
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("������[˰������]��");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "˰������"))) {
		return false;
	}
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("����[˰������]Ӧ����0��100֮�䣡");
		FormName.sjjmje.select();
		return false;
	}


	if(	javaTrim(FormName.kglf)=="") {
		alert("��ѡ��[�۹����]��");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "�۹����"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") 
	{
		alert("��ѡ��[��������]��");
		FormName.kqtk.focus();
		return false;
	}

	if(!(isFloat(FormName.kqtk, "��������"))) 
	{
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

	FormName.action="SaveEditCrm_zjxdj.jsp";
	FormName.submit();
	return true;
}


function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="endZjx.jsp";

	FormName.submit();
	return true;
}

function f_scwc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="deleteEndZjx.jsp";

	FormName.submit();
	return true;
}

function f_lrfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}
function f_xzxm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}
function f_dybj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="dybj.jsp";

	FormName.submit();
	return true;
}

function f_ewlr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xmpx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		winOpen("dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
}

function f_bgmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	window.open("ViewCrm_zjxdj.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>");
}

function f_dy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	window.open("dzbj/zxbjmx/Bj_khbjmxBgdList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>");
}



//-->
</SCRIPT>
