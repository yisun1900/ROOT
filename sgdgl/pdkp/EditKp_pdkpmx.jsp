<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kp_yzfsgdkpjg.sgd,sq_sgd.sgdmc,kp_yzfsgdkpjg.zbj,kp_yzfsgdkpjg.zbjxs,kp_yzfsgdkpjg.bzs,kp_yzfsgdkpjg.khpjdf,kp_yzfsgdkpjg.tsdf,kp_yzfsgdkpjg.wxdf,kp_yzfsgdkpjg.kpdf,kp_yzfsgdkpjg.fdfs,kp_yzfsgdkpjg.bqzf,kp_yzfsgdkpjg.bqpm,kp_yzfsgdkpjg.sqpm,kp_yzfsgdkpjg.sqsyddje,kp_yzfsgdkpjg.sqsyzdje,kp_yzfsgdkpjg.sqsyxdje,kp_yzfsgdkpjg.sqpjqde,kp_yzfsgdkpjg.gdjdexs,kp_yzfsgdkpjg.bqbzjdze,kp_yzfsgdkpjg.gsddbl,kp_yzfsgdkpjg.gdddbl,kp_yzfsgdkpjg.ddbzjde,kp_yzfsgdkpjg.gszdbl,kp_yzfsgdkpjg.gdzdbl,kp_yzfsgdkpjg.zdbzjde,kp_yzfsgdkpjg.gsxdbl,kp_yzfsgdkpjg.gdxdbl,kp_yzfsgdkpjg.xdbzjde,kp_yzfsgdkpjg.ddhdje,kp_yzfsgdkpjg.zdhdje,kp_yzfsgdkpjg.xdhdje,kp_yzfsgdkpjg.zdtscs,kp_yzfsgdkpjg.tskddje,kp_yzfsgdkpjg.tskzdje,kp_yzfsgdkpjg.tskxdje,kp_yzfsgdkpjg.tsjcdd,kp_yzfsgdkpjg.tsjczd,kp_yzfsgdkpjg.tsjcxd,kp_yzfsgdkpjg.kjddze,kp_yzfsgdkpjg.kjzdze,kp_yzfsgdkpjg.kjxdze,kp_yzfsgdkpjg.kjdze,kp_yzfsgdkpjg.yjddje,kp_yzfsgdkpjg.yjzdje,kp_yzfsgdkpjg.yjxdje,kp_yzfsgdkpjg.syddje,kp_yzfsgdkpjg.syzdje,kp_yzfsgdkpjg.syxdje, DECODE(kp_yzfsgdkpjg.djbz,'N','δ����','Y','�Ѷ���'),kp_yzfsgdkpjg.bz  ";
	ls_sql+=" FROM sq_sgd,kp_yzfsgdkpjg  ";
    ls_sql+=" where kp_yzfsgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_yzfsgdkpjg.kpjlh="+kpjlh;
    ls_sql+=" order by kp_yzfsgdkpjg.kpjlh,kp_yzfsgdkpjg.bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"kpjlh","sgd","sq_sgd_sgdmc","kp_yzfsgdkpjg_zbj","kp_yzfsgdkpjg_zbjxs","kp_yzfsgdkpjg_bzs","kp_yzfsgdkpjg_khpjdf","kp_yzfsgdkpjg_tsdf","kp_yzfsgdkpjg_wxdf","kp_yzfsgdkpjg_kpdf","kp_yzfsgdkpjg_fdfs","kp_yzfsgdkpjg_bqzf","kp_yzfsgdkpjg_bqpm","kp_yzfsgdkpjg_sqpm","kp_yzfsgdkpjg_sqsyddje","kp_yzfsgdkpjg_sqsyzdje","kp_yzfsgdkpjg_sqsyxdje","kp_yzfsgdkpjg_sqpjqde","kp_yzfsgdkpjg_gdjdexs","kp_yzfsgdkpjg_bqbzjdze","kp_yzfsgdkpjg_gsddbl","kp_yzfsgdkpjg_gdddbl","kp_yzfsgdkpjg_ddbzjde","kp_yzfsgdkpjg_gszdbl","kp_yzfsgdkpjg_gdzdbl","kp_yzfsgdkpjg_zdbzjde","kp_yzfsgdkpjg_gsxdbl","kp_yzfsgdkpjg_gdxdbl","kp_yzfsgdkpjg_xdbzjde","kp_yzfsgdkpjg_ddhdje","kp_yzfsgdkpjg_zdhdje","kp_yzfsgdkpjg_xdhdje","kp_yzfsgdkpjg_zdtscs","kp_yzfsgdkpjg_tskddje","kp_yzfsgdkpjg_tskzdje","kp_yzfsgdkpjg_tskxdje","kp_yzfsgdkpjg_tsjcdd","kp_yzfsgdkpjg_tsjczd","kp_yzfsgdkpjg_tsjcxd","kp_yzfsgdkpjg_kjddze","kp_yzfsgdkpjg_kjzdze","kp_yzfsgdkpjg_kjxdze","kp_yzfsgdkpjg_kjdze","kp_yzfsgdkpjg_yjddje","kp_yzfsgdkpjg_yjzdje","kp_yzfsgdkpjg_yjxdje","kp_yzfsgdkpjg_syddje","kp_yzfsgdkpjg_syzdje","kp_yzfsgdkpjg_syxdje","kp_yzfsgdkpjg_djbz","kp_yzfsgdkpjg_bz"};
	pageObj.setDisColName(disColName);
*/
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sgd"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="EditKp_yzfsgdkpjg.jsp?kpjlh="+kpjlh;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sgdmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ���ӿ��������������¼�ţ�<%=kpjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">�ʱ���</td>
	<td  width="1%">�ʱ���ϵ��</td>
	<td  width="1%">������</td>
	<td  width="1%">�ͻ����۵÷�</td>
	<td  width="1%">Ͷ����÷�</td>
	<td  width="1%">ά����÷�</td>
	<td  width="1%">�����÷�</td>
	<td  width="1%">��������</td>
	<td  width="1%">�����ܷ�</td>
	<td  width="1%">��������</td>
	<td  width="1%">��������</td>
	<td  width="1%">����ʣ��󵥽��</td>
	<td  width="1%">����ʣ���е����</td>
	<td  width="1%">����ʣ��С�����</td>
	<td  width="1%">����ƽ��ǩ����</td>
	<td  width="1%">���ӽӵ���ϵ��</td>
	<td  width="1%">����׼�ӽӵ��ܶ�</td>
	<td  width="1%">��˾����ռ����</td>
	<td  width="1%">ʩ���Ӵ󵥱���</td>
	<td  width="1%">�󵥱�׼�ӵ���</td>
	<td  width="1%">��˾�е���ռ����</td>
	<td  width="1%">ʩ�����е�����</td>
	<td  width="1%">�е���׼�ӵ���</td>
	<td  width="1%">��˾С����ռ����</td>
	<td  width="1%">ʩ����С������</td>
	<td  width="1%">С����׼�ӵ���</td>
	<td  width="1%">�󵥻ص����</td>
	<td  width="1%">�е��ص����</td>
	<td  width="1%">С���ص����</td>
	<td  width="1%">�ش�Ͷ�ߴ���</td>
	<td  width="1%">�ش�Ͷ�߿۴�</td>
	<td  width="1%">�ش�Ͷ�߿��е�</td>
	<td  width="1%">�ش�Ͷ�߿�С��</td>
	<td  width="1%">���⽱���򴦷���</td>
	<td  width="1%">���⽱���򴦷��е�</td>
	<td  width="1%">���⽱���򴦷�С��</td>
	<td  width="1%">���ڿɽӴ��ܶ�</td>
	<td  width="1%">���ڿɽ��е��ܶ�</td>
	<td  width="1%">���ڿɽ�С���ܶ�</td>
	<td  width="1%">���ڿɽӵ��ܶ�</td>
	<td  width="1%">�ѽӴ󵥽��</td>
	<td  width="1%">�ѽ��е����</td>
	<td  width="1%">�ѽ�С�����</td>
	<td  width="1%">ʣ��󵥽��</td>
	<td  width="1%">ʣ���е����</td>
	<td  width="1%">ʣ��С�����</td>
	<td  width="1%">�����־</td>
	<td  width="1%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>