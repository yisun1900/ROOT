<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String zdyhbz=(String)session.getAttribute("zdyhbz");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");

	String yhdlm=(String)session.getAttribute("yhdlm");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where zwbm='05' and yhdlm='"+yhdlm+"' ");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�������գ�ά��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                �ֹ�˾              </td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%" align="right"> 
                ǩԼ����              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ͻ����</td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td width="33%"> 
              <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="18%" align="right">�ͻ�����</td>
              <td width="32%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#0000CC"><b>��ϵ��ʽ</b></font>              </td>
              <td width="33%"> 
              <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="18%" align="right"> 
                ��ϵ��ʽ              </td>
              <td width="32%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ���ݵ�ַ              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">���ʦ</td>
              <td width="33%"> 
              <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >              </td>
              <td width="18%">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ʩ����              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by cxbz,sgdmc","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                ���̵���              </td>
              <td width="32%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='05' order by yhmc","");
	}
	else
	{
		if (zdyhbz.equals("Y") || yhmc==null)
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc","");
		}
		else{
			cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc",yhmc,false);
		}
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ��Ŀ����              </td>
              <td width="33%"> 
                <select name="crm_gcfxysjl_ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
					<option value=""></option>
				<%
					cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
				%>
                </select>              </td>
              <td width="18%" align="right"> 
                ������Ŀ              </td>
              <td width="32%"> 
                <select name="crm_gcfxysjl_gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm order by ysxmflbm,gcysxmbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ�ͻ�����ǩ��</td>
              <td><input type="radio" name="sfkhbrqz"  value="Y">
                ��
                <input type="radio" name="sfkhbrqz"  value="N">
                �� </td>
              <td align="right">��ǩ���Ƿ�����Ȩ</td>
              <td><input type="radio" name="dqzysq"  value="Y">
                ��
                <input type="radio" name="dqzysq"  value="N">
                ����Ȩ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����ʱ�� ��</td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_yssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_yssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ������              </td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_ysr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                ¼����              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ¼��ʱ�� ��              </td>
              <td width="33%"> 
              <input type="text" name="crm_gcfxysjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                ��              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ¼�벿��              </td>
              <td width="33%"> 
                <select name="crm_gcfxysjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A1','F1') and  cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A1','F1') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                ���ռ�¼��              </td>
              <td width="32%"> 
                <input type="text" name="crm_gcfxysjl_ysjlh" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="17%" align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_gcfxysjl.ysjlh">���ռ�¼��</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">������Ŀ</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">��Ŀ����</option>
                  <option value="crm_gcfxysjl.ysr ">������</option>
                  <option value="crm_gcfxysjl.lrsj desc " selected>¼��ʱ��</option>
                  <option value="crm_gcfxysjl.yssj desc " >����ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.ysxmflbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_gcfxysjl.ysjlh">���ռ�¼��</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">������Ŀ</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">��Ŀ����</option>
                  <option value="crm_gcfxysjl.ysr ">������</option>
                  <option value="crm_gcfxysjl.yssj desc ">����ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.ysxmflbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','δ����','2','����')">�����Ƿ�����</option>
                  <option value="crm_khxx.yqts">������������</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_gcfxysjl.ysjlh">���ռ�¼��</option>
                  <option value="crm_gcfxysjl.gcysxmbm ">������Ŀ</option>
                  <option value="crm_gcfxysjl.ysxmflbm ">��Ŀ����</option>
                  <option value="crm_gcfxysjl.ysr ">������</option>
                  <option value="crm_gcfxysjl.yssj desc ">����ʱ��</option>
                  <option value="crm_khxx.khbh ">�ͻ����</option>
                  <option value="crm_khxx.khxm">�ͻ�����</option>
                  <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                  <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                  <option value="crm_khxx.sjs">���ʦ</option>
                  <option value="crm_khxx.sgd">ʩ����</option>
                  <option value="crm_khxx.zjxm">���̵���</option>
                  <option value="crm_khxx.hth">��ͬ��</option>
                  <option value="crm_khxx.ysxmflbm">���̽���</option>
                  <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                  <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                  <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                  <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                  <option value="crm_khxx.dwbh">ǩԼ����</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ��ϸ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_gcfxysjl_yssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_yssj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcfxysjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="Crm_gcfxysjlList.jsp";


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
