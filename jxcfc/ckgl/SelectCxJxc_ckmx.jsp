<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">���ⵥ��ϸ����ѯ </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">��ѯ�������</td>
    <td colspan="3"> ��һ��
      <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="jxc_ckd.ckph" selected>��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
        </select>
      �ڶ���
      <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm" selected>����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc" selected>��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      <BR>
      ������
      <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" >��ʾ���</td>
    <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
      ��ҳ
      <input type="radio" name="xsfg" value="2">
      EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
      <input type="text" name="myxssl" size="7" maxlength="13" value="25">    </td>
  </tr>
  <tr align="center">
    <td colspan="4"><input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="����">    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">ͳ�Ʊ�</td>
    <td colspan="3"> ��һ��
      <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
        </select>
      �ڶ���
      <input type="hidden" name="tj2name" value="">
      <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <input type="hidden" name="tj3name" value="">
      <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      <BR>
      ������
      <input type="hidden" name="tj4name" value="">
      <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <input type="hidden" name="tj5name" value="">
      <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>
      ������
      <input type="hidden" name="tj6name" value="">
      <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
        <option value=""></option>
          <option value="jxc_ckd.ckph">��������</option>
          <option value="jxc_ckd.lrsj">¼��ʱ��</option>
          <option value="jxc_ckd.lydh">��Դ����</option>
          <option value="jxc_ckd.cksj">����ʱ��</option>

          <option value="jxc_ckmx.cldlbm">���ϴ���</option>
          <option value="jxc_ckmx.clxlbm">����С��</option>
          <option value="jxc_ckmx.ppmc">��Ʒ��</option>
          <option value="jxc_ckmx.gysmc">��Ӧ��</option>
          <option value="jxc_ckmx.clbm">���ϱ���</option>
          <option value="jxc_ckmx.nbbm">�ڲ�����</option>
          <option value="jxc_ckmx.clmc">��������</option>
          <option value="jxc_ckmx.xh">�ͺ�</option>
          <option value="jxc_ckmx.gg">���</option>
      </select>    </td>
  </tr>
  <tr align="center">
    <td colspan="4"><input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ֹ�˾</td>
    <td><select name="jxc_ckd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%>
    </select></td>
    <td align="right">����</td>
    <td><select name="jxc_ckd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td><input type="text" name="jxc_ckd_ckph" size="20" maxlength="13" ></td>
    <td align="right">����ֿ�</td>
    <td><select name="jxc_ckd_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc order by ckbh","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����ʱ��</span> ��</td>
    <td><input type="text" name="jxc_ckd_cksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right"><span class="STYLE1">��</span></td>
    <td><input type="text" name="jxc_ckd_cksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td><select name="jxc_ckd_cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="D">��������</option>
      <option value="B">���ϳ���</option>
      <option value="T">�˻�����</option>
      <option value="S">�깺����</option>
      <option value="P">���ϵ�����</option>
      <option value="J">���Ĵ���ȯ����</option>
      <option value="X">���۳���</option>
      <option value="R">��������</option>
    </select></td>
    <td align="right">���ⵥ״̬</td>
    <td><select name="jxc_ckd_ckdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectToken(out,"0+δ�ύ&1+�ȴ��������&2+�ȴ��˻����&3+�ȴ��������&4+�ѽ���&5+�˻����ͨ��&6+�������δͨ��&7+�˻����δͨ��&8+���ͨ��&9+�ύ","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼������ ��</td>
    <td><input type="text" name="jxc_ckd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="jxc_ckd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ƻ��ͻ�ʱ�� ��</td>
    <td><input type="text" name="jxc_ckd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="jxc_ckd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼����</td>
    <td><input type="text" name="jxc_ckd_lrr" size="20" maxlength="20" ></td>
    <td align="right">��Դ����</td>
    <td><input name="lydh" type="text" size="20" maxlength="13"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ϴ���</td>
    <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(selectform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
    </select></td>
    <td align="right">����С��</td>
    <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">���ϱ���</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_clbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_nbbm" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckmx_clmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_clmc2" size="20" maxlength="100" >
    (ģ����ѯ)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_xh" size="20" maxlength="100" >
    (ģ����ѯ)</td>
  <td align="right" width="18%">���</td> 
  <td width="32%"><input type="text" name="jxc_ckmx_gg" size="20" maxlength="100" >
    (ģ����ѯ)</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ʒ��</td> 
  <td width="32%"> 
    <select name="jxc_ckmx_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
    </select>  </td>
  <td align="right" width="18%">��Ӧ��</td> 
  <td width="32%"> 
    <select name="jxc_ckmx_gysmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('2','3') order by gysmc","");
%>
    </select>  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
    <input type="reset"  value="����">  </td>
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
	cf.ajax(out);//����AJAX
%>

var lx;

function changeClxlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.clxlbm.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="cldlbm";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="cldlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
	}
}

function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.jxc_ckd_cksj)=="") {
		alert("������[����ʱ��]��");
		FormName.jxc_ckd_cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jxc_ckd_cksj2)=="") {
		alert("������[����ʱ��]��");
		FormName.jxc_ckd_cksj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj2, "����ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.jxc_ckd_lrsj, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj2, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	
	if (lx=="cx")
	{
		FormName.action="Jxc_ckmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jxc_ckmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
