<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));

	ls_sql="SELECT gdm_gdjcjl.jcjlh,DECODE(gdm_gdjcjl.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','B','�ڴ���'),DECODE(gdm_gdjcjl.cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��'), DECODE(gdm_gdjcjl.sffszg,'Y','����','N','δ����'),gdm_gdjcjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,gdm_gdjcjl.kfzs,gdm_gdjcjl.fkze,gdm_gdjcjl.jlje,gdm_gdjcjl.spr,gdm_gdjcjl.spsj,gdm_gdjcjl.spyj,gdm_gdjcjl.yqjjsj,gdm_gdjcjl.dwbh,gdm_gdjcjl.zrr,gdm_gdjcjl.ygbh, DECODE(gdm_gdjcjl.sfxldcl,'Y','��Ҫδ����','N','����Ҫ','C','�Ѵ���'),gdm_gdjcjl.ldyqjjsj,gdm_gdjcjl.ldclyj,gdm_gdjcjl.ldclr,gdm_gdjcjl.ldclsj,gdm_gdjcjl.jssj,gdm_gdjcjl.jsr,gdm_gdjcjl.jssm,gdm_gdjcjl.jhcfasj,gdm_gdjcjl.cfajlh,gdm_gdjcjl.sjcfasj,gdm_gdjcjl.sjcfar,gdm_gdjcjl.jjfa,gdm_gdjcjl.jhjjsj,gdm_gdjcjl.shbm,gdm_gdjcjl.shr,gdm_gdjcjl.shsj,gdm_gdjcjl.shsm,gdm_gdjcjl.cljlh,gdm_gdjcjl.clsj,gdm_gdjcjl.clr,gdm_gdjcjl.clqk, DECODE(gdm_gdjcjl.kpbz,'N','δ����','Y','�ѿ���'),gdm_gdjcjl.kpjlh, DECODE(gdm_gdjcjl.jsbz,'N','δ����','Y','�ѽ���'),gdm_gdjcjl.jsjlh,gdm_gdjcjl.lrr,gdm_gdjcjl.lrsj,a.dwmc lrdw,gdm_gdjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,gdm_gdjcjl,sq_sgd,sq_dwxx a,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm ";
    ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and gdm_gdjcjl.lrdw=a.dwbh(+)";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.sjjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=" order by gdm_gdjcjl.lrsj " ;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ؼ���¼����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">����¼��</td>
	<td  width="1%">����״̬</td>
	<td  width="1%">����������־</td>
	<td  width="1%">�Ƿ�������</td>
	<td  width="1%">�ͻ����</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="3%">���ݵ�ַ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">���ʦ</td>
	<td  width="1%">�����</td>
	<td  width="2%">���ʱ��</td>
	<td  width="1%">��Ϣ��Դ</td>
	<td  width="1%">�������</td>
	<td  width="1%">�����</td>
	<td  width="1%">�������</td>
	<td  width="1%">�۷�����</td>
	<td  width="1%">�����ܶ�</td>
	<td  width="1%">�������</td>

	<td  width="1%">����������</td>
	<td  width="2%">��������ʱ��</td>
	<td  width="4%">�����������</td>

	<td  width="2%">�ͻ�Ҫ����ʱ��</td>
	<td  width="1%">���β���</td>
	<td  width="1%">������</td>
	<td  width="1%">�����˱��</td>
	<td  width="1%">�Ƿ����쵼����</td>
	<td  width="2%">�쵼Ҫ����ʱ��</td>
	<td  width="6%">�쵼�������</td>
	<td  width="1%">�쵼������</td>
	<td  width="2%">�쵼����ʱ��</td>
	<td  width="2%">����ʱ��</td>
	<td  width="1%">������</td>
	<td  width="6%">����˵��</td>
	<td  width="2%">�ƻ�������ʱ��</td>
	<td  width="1%">��������¼��</td>
	<td  width="2%">ʵ�ʳ�����ʱ��</td>
	<td  width="1%">ʵ�ʳ�������</td>
	<td  width="6%">�������</td>
	<td  width="2%">�ƻ����ʱ��</td>
	<td  width="2%">������˲���</td>
	<td  width="1%">���������</td>
	<td  width="2%">�������ʱ��</td>
	<td  width="4%">�������˵��</td>
	<td  width="1%">�����¼��</td>
	<td  width="2%">���´���ʱ��</td>
	<td  width="1%">���´�����</td>
	<td  width="6%">���´������</td>
	<td  width="1%">������־</td>
	<td  width="1%">������¼��</td>
	<td  width="1%">�����־</td>
	<td  width="1%">�����¼��</td>
	<td  width="1%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">¼�뵥λ</td>
	<td  width="81%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>