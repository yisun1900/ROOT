<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='152113'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[��׼��Ŀά��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
	String ls_sql="";
	
	
	String dqbm=request.getParameter("dqbm");
	
	String glfxclbm=request.getParameter("oldglfxclbm");



	ls_sql="SELECT bj_jzbjb.xmbh,bj_jzbjb.xmmc,bj_jzglfxb.dqbm,bj_jzglfxb.bjbbh,bj_jzglfxb.bjjbbm";
	ls_sql+=" ,glflmc,bj_jzglfxb.glbxh,bj_jzglfxb.glfxclbm,bj_jzglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_jzglfxb.jldwbm,bj_jzglfxb.xhl,bj_jzglfxb.dj,ROUND(bj_jzglfxb.xhl*bj_jzglfxb.dj,2) je,bj_jzglfxb.jqsfl,bj_jzglfxb.bsfl,bj_jzglfxb.tvocsfl,DECODE(bj_jzglfxb.wlllbz,'Y','��Ҫ','N','��') wlllbz,DECODE(bj_jzglfxb.lx,'1','��ӡ','2','����ӡ') lx,bj_jzglfxb.lrr,bj_jzglfxb.lrsj,bj_jzglfxb.bz   ";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,bdm_glflbm,jxc_clbm  ";
    ls_sql+=" where bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm ";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and bj_jzglfxb.glfxclbm=jxc_clbm.nbbm(+) ";
	ls_sql+=" and bj_jzglfxb.dqbm=bj_jzbjb.dqbm";
	ls_sql+=" and (bj_jzglfxb.dqbm='"+dqbm+"') ";
	ls_sql+=" and (bj_jzglfxb.glfxclbm='"+glfxclbm+"') ";
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
//������ʾ��

	String[] disColName={"xmbh","xmmc","glflmc","glbxh","glfxclbm","glfxclmc","ppmc","xh","gg","jldwbm","xhl","dj","je","jqsfl","bsfl","tvocsfl","wlllbz","lx","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","bjbbh","bjjbbm","xmbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXmbhGlfx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xmbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ϸ����������滻����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��Ŀ���</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="3%">���Ϸ���</td>
	<td  width="3%">�������</td>
	<td  width="4%">���ϱ���</td>
	<td  width="7%">��������</td>
      <td width="6%">Ʒ��</td>
      <td width="6%">�ͺ�</td>
      <td width="7%">���</td>
	<td  width="3%">������λ</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="5%">���</td>
	<td  width="3%">��ȩ�ͷ���</td>
	<td  width="3%">���ͷ���</td>
	<td  width="3%">TVOC�ͷ���</td>
	<td  width="3%">�赽��������</td>
	<td  width="3%">����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="517%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>