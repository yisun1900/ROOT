<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String fgsbh=request.getParameter("fgsbh");
	String yhmc=cf.GB2Uni(cf.getParameter(request,"yhmc"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����������</font></b>
</CENTER>
<table border="1" width="410%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">���̽���</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">�˵���־</td>
	<td  width="2%">ǩ������ҵ��ʱ��</td>
	<td  width="2%">�˵�����ҵ��ʱ��</td>
	  <td  width="2%" >��ȯ���</td>
	<td  width="3%">��ǰ��ͬ�ܶ�</td>
	<td  width="1%">�ۿ���</td>
	<td  width="3%">�ۺ��ͬ�ܶ�</td>
	<td  width="2%">������</td>
	<td  width="3%">��ǰ���̷�</td>
	<td  width="3%">�ۺ󹤳̷�</td>
	<td  width="2%">˰��</td>
	<td  width="2%">��ǰ˰��</td>
	<td  width="2%">˰��</td>
	<td  width="2%">����Ѱٷֱ�</td>
	<td  width="2%">��ǰ�����</td>
	<td  width="2%">�ۺ�����</td>
	<td  width="2%">��ǰ����ҵ��������</td>
	<td  width="2%">�ۺ����ҵ��������</td>
	<td  width="2%">��ǰ����ҵ��������</td>
	<td  width="2%">�ۺ󲻼�ҵ��������</td>
	<td  width="2%">��ǰ��Ʒ�</td>
	<td  width="2%">�ۺ���Ʒ�</td>


	<td  width="3%">����ʵ�տ�</td>
	<td  width="2%">�״���װ��ʱ��</td>
	<td  width="2%">�����״����ʱ��</td>


	<td  width="2%">��ȯ�ܽ��</td>
	<td  width="2%">��˾�е���ȯ��</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">�ʼ�Ա</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="1%">ҵ��Ա</td>
	<td  width="1%">����Ա</td>
	<td  width="1%">�곤</td>
	<td  width="1%">��Ա</td>
	<td  width="1%">���</td>
	<td  width="8%">�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="2%">�˵�ʱ��</td>
	<td  width="43%">��ȡ��Ʒ</td>
</tr>
<%
	ls_sql="SELECT '',crm_khxx.sjs,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,ysgcjdmc,bjjbmc,DECODE(crm_khxx.zt,'2','ǩ��','3','�˵��ͻ�','5','���'),crm_khxx.yjjzsj,crm_khxx.tdyjjzsj,(select sum(fqje) from cw_khfqdj  where cw_khfqdj.scbz='N' and cw_khfqdj.khbh=crm_khxx.khbh),crm_khxx.wdzgce,TO_CHAR(crm_khxx.zkl),crm_khxx.qye,crm_khxx.zhljzjx,crm_khxx.zqgczjf,crm_khxx.zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(crm_khxx.zqsjf,0)+NVL(crm_zxkhxx.sjhtje,0),NVL(crm_khxx.sjf,0)+NVL(crm_zxkhxx.sjhtje,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,crm_khxx.zjxm,crm_khxx.khjl,crm_khxx.ywy,crm_khxx.clgw,crm_khxx.dianz,crm_khxx.weny,TO_CHAR(crm_khxx.fwmj),crm_khxx.cxhdbm,a.dwmc qydm,TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD'),crm_khxx.tdsj,(select lpmc from yx_lqlpdj where yx_lqlpdj.khbh=crm_khxx.khbh and rownum<2) ";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_sgd,bdm_bjjbbm,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.khjl='"+yhmc+"' and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" and crm_khxx.gcjdbm in('1')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ



	ls_sql+=" order by sjs,qyrq";

// 	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
	pageObj.printFoot();
%>
</table>

</body>
</html>