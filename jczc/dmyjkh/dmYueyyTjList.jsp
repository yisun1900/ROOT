<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,ssdqmc,dqmc,(select dwmc from sq_dwxx b where b.dwbh=sq_dwxx.ssfgs) ssfgs,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,dwflmc,sq_dwxx.bianma,sq_dwxx.cwdm,sq_dwxx.hthqz,ssfwmc,dwjbmc,dmxsmc,bzrs,dwdh,dwcz,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm,dm_ssfw,dm_dwjb,dm_dmxs  ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
    ls_sql+=" and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.dwlx,dwbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("dmYueyyTjList.jsp","EnterDmYueyyTj.jsp","","InsertCw_dmkhjl.jsp?nian="+nian+"&yue="+yue);
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","sq_dwxx_dwmc","sq_dwxx_dwjc","sq_dwxx_ssdw","sq_dwxx_dwlx","sq_dwxx_dwfzr","sq_dwxx_dwdh","dm_fgflbm_fgflmc","dm_ysbm_ysmc","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditBolt("");
	pageObj.setEditStr("ͳ��");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_dmkhcz.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dwmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������Ӫͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">��λ���</td>
	<td  width="6%">��λ����</td>
	<td  width="3%">��������</td>
	<td  width="3%">��������</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="4%">�ϼ���λ</td>
	<td  width="3%">��λ����</td>
	<td  width="2%">����</td>
	<td  width="2%">�������</td>
	<td  width="3%">��ͬ��ǰ׺</td>
	<td  width="6%">������λ</td>
	<td  width="3%">��λ����</td>
	<td  width="3%">������ʽ</td>
	<td  width="3%">��׼����</td>
	<td  width="13%">�绰</td>
	<td  width="7%">����</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ص�ʱ��</td>
	<td  width="13%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>