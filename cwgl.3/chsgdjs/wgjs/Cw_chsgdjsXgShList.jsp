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
	String cw_chsgdjs_jsjlh=null;
	String cw_chsgdjs_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String cw_chsgdjs_clzt=null;
	String cw_chsgdjs_spr=null;
	String cw_chsgdjs_spsj=null;
	String cw_chsgdjs_lrr=null;
	String cw_chsgdjs_lrsj=null;
	String cw_chsgdjs_lrbm=null;
	cw_chsgdjs_jsjlh=request.getParameter("cw_chsgdjs_jsjlh");
	if (cw_chsgdjs_jsjlh!=null)
	{
		cw_chsgdjs_jsjlh=cf.GB2Uni(cw_chsgdjs_jsjlh);
		if (!(cw_chsgdjs_jsjlh.equals("")))	wheresql+=" and  (cw_chsgdjs.jsjlh='"+cw_chsgdjs_jsjlh+"')";
	}
	cw_chsgdjs_khbh=request.getParameter("cw_chsgdjs_khbh");
	if (cw_chsgdjs_khbh!=null)
	{
		cw_chsgdjs_khbh=cf.GB2Uni(cw_chsgdjs_khbh);
		if (!(cw_chsgdjs_khbh.equals("")))	wheresql+=" and  (cw_chsgdjs.khbh='"+cw_chsgdjs_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	cw_chsgdjs_clzt=request.getParameter("cw_chsgdjs_clzt");
	if (cw_chsgdjs_clzt!=null)
	{
		cw_chsgdjs_clzt=cf.GB2Uni(cw_chsgdjs_clzt);
		if (!(cw_chsgdjs_clzt.equals("")))	wheresql+=" and  (cw_chsgdjs.clzt='"+cw_chsgdjs_clzt+"')";
	}
	cw_chsgdjs_spr=request.getParameter("cw_chsgdjs_spr");
	if (cw_chsgdjs_spr!=null)
	{
		cw_chsgdjs_spr=cf.GB2Uni(cw_chsgdjs_spr);
		if (!(cw_chsgdjs_spr.equals("")))	wheresql+=" and  (cw_chsgdjs.spr='"+cw_chsgdjs_spr+"')";
	}
	cw_chsgdjs_spsj=request.getParameter("cw_chsgdjs_spsj");
	if (cw_chsgdjs_spsj!=null)
	{
		cw_chsgdjs_spsj=cw_chsgdjs_spsj.trim();
		if (!(cw_chsgdjs_spsj.equals("")))	wheresql+="  and (cw_chsgdjs.spsj=TO_DATE('"+cw_chsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_lrr=request.getParameter("cw_chsgdjs_lrr");
	if (cw_chsgdjs_lrr!=null)
	{
		cw_chsgdjs_lrr=cf.GB2Uni(cw_chsgdjs_lrr);
		if (!(cw_chsgdjs_lrr.equals("")))	wheresql+=" and  (cw_chsgdjs.lrr='"+cw_chsgdjs_lrr+"')";
	}
	cw_chsgdjs_lrsj=request.getParameter("cw_chsgdjs_lrsj");
	if (cw_chsgdjs_lrsj!=null)
	{
		cw_chsgdjs_lrsj=cw_chsgdjs_lrsj.trim();
		if (!(cw_chsgdjs_lrsj.equals("")))	wheresql+="  and (cw_chsgdjs.lrsj=TO_DATE('"+cw_chsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_lrbm=request.getParameter("cw_chsgdjs_lrbm");
	if (cw_chsgdjs_lrbm!=null)
	{
		cw_chsgdjs_lrbm=cf.GB2Uni(cw_chsgdjs_lrbm);
		if (!(cw_chsgdjs_lrbm.equals("")))	wheresql+=" and  (cw_chsgdjs.lrbm='"+cw_chsgdjs_lrbm+"')";
	}
	ls_sql="SELECT cw_chsgdjs.jsjlh,cw_chsgdjs.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,cw_chsgdjs.sgbz,cw_chsgdjs.jsrq,cw_chsgdjs.qye,cw_chsgdjs.zjxje,cw_chsgdjs.zxje,cw_chsgdjs.jxje,cw_chsgdjs.htsgcb,cw_chsgdjs.zjxsgcb,cw_chsgdjs.zjcbglfbl,cw_chsgdjs.zjcbglf,cw_chsgdjs.sdlzxje,cw_chsgdjs.sdlcbfbl,cw_chsgdjs.sldzjcb,cw_chsgdjs.htwzjje,cw_chsgdjs.htwzjcbbl,cw_chsgdjs.htwzjcb,cw_chsgdjs.sgcb,cw_chsgdjs.sgcbclf,cw_chsgdjs.sgcbrgf,cw_chsgdjs.sssjf,cw_chsgdjs.sjfbl,cw_chsgdjs.sjftc,cw_chsgdjs.fwmj,cw_chsgdjs.kqzlf,cw_chsgdjs.bbjf,cw_chsgdjs.bqtf,cw_chsgdjs.bqtfsm,cw_chsgdjs.htnsdje,cw_chsgdjs.htnsdjebl,cw_chsgdjs.bsdcb,cw_chsgdjs.ycfje,cw_chsgdjs.ycfbl,cw_chsgdjs.bycf,cw_chsgdjs.cbhjje,cw_chsgdjs.kzbjbl,cw_chsgdjs.kzbj,cw_chsgdjs.kgcyz,cw_chsgdjs.kfxbzjbl,cw_chsgdjs.kfxbzj,cw_chsgdjs.xxfh,cw_chsgdjs.clcb,cw_chsgdjs.cldbbl,cw_chsgdjs.clbdbkk,cw_chsgdjs.kgjsje,cw_chsgdjs.kqtf,cw_chsgdjs.kqtfsm,cw_chsgdjs.kxcf,cw_chsgdjs.sjzfe, DECODE(cw_chsgdjs.clzt,'1','����','2','����'),cw_chsgdjs.spr,cw_chsgdjs.spsj,cw_chsgdjs.spyj,cw_chsgdjs.lrr,cw_chsgdjs.lrsj,dwmc lrbm,cw_chsgdjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_chsgdjs,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_chsgdjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_chsgdjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_chsgdjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_chsgdjs.clzt='2'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_chsgdjsXgShList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_chsgdjs_khbh","crm_khxx_khxm","crm_khxx_fwdz","cw_chsgdjs_sgd","cw_chsgdjs_sgbz","cw_chsgdjs_jsrq","cw_chsgdjs_qye","cw_chsgdjs_zjxje","cw_chsgdjs_zxje","cw_chsgdjs_jxje","cw_chsgdjs_htsgcb","cw_chsgdjs_zjxsgcb","cw_chsgdjs_zjcbglfbl","cw_chsgdjs_zjcbglf","cw_chsgdjs_sdlzxje","cw_chsgdjs_sdlcbfbl","cw_chsgdjs_sldzjcb","cw_chsgdjs_htwzjje","cw_chsgdjs_htwzjcbbl","cw_chsgdjs_htwzjcb","cw_chsgdjs_sgcb","cw_chsgdjs_sgcbclf","cw_chsgdjs_sgcbrgf","cw_chsgdjs_sssjf","cw_chsgdjs_sjfbl","cw_chsgdjs_sjftc","cw_chsgdjs_fwmj","cw_chsgdjs_kqzlf","cw_chsgdjs_bbjf","cw_chsgdjs_bqtf","cw_chsgdjs_bqtfsm","cw_chsgdjs_htnsdje","cw_chsgdjs_htnsdjebl","cw_chsgdjs_bsdcb","cw_chsgdjs_ycfje","cw_chsgdjs_ycfbl","cw_chsgdjs_bycf","cw_chsgdjs_cbhjje","cw_chsgdjs_kzbjbl","cw_chsgdjs_kzbj","cw_chsgdjs_kgcyz","cw_chsgdjs_kfxbzjbl","cw_chsgdjs_kfxbzj","cw_chsgdjs_xxfh","cw_chsgdjs_clcb","cw_chsgdjs_cldbbl","cw_chsgdjs_clbdbkk","cw_chsgdjs_kgjsje","cw_chsgdjs_kqtf","cw_chsgdjs_kqtfsm","cw_chsgdjs_kxcf","cw_chsgdjs_sjzfe","cw_chsgdjs_clzt","cw_chsgdjs_spr","cw_chsgdjs_spsj","cw_chsgdjs_spyj","cw_chsgdjs_lrr","cw_chsgdjs_lrsj","cw_chsgdjs_lrbm","cw_chsgdjs_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteSh.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_chsgdjs.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">������ˣ��޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="1%">�����¼��</td>
	<td  width="1%">�ͻ����</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="4%">���ݵ�ַ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">ʩ���೤</td>
	<td  width="2%">��������</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">������</td>
	<td  width="2%">������</td>
	<td  width="2%">������</td>
	<td  width="2%">��ͬʩ���ɱ�</td>
	<td  width="2%">������ʩ���ɱ�</td>
	<td  width="2%">ֱ�ӳɱ�����ѱ���</td>
	<td  width="2%">ֱ�ӳɱ������</td>
	<td  width="2%">ˮ��·������</td>
	<td  width="2%">ˮ��·�ɱ��ѱ���</td>
	<td  width="2%">ˮ��·����ֱ�ӳɱ���</td>
	<td  width="2%">��ͬ����Ŀ���ӽ��</td>
	<td  width="2%">��ͬ����Ŀ���ӳɱ�����</td>
	<td  width="2%">��ͬ����Ŀ����ֱ�ӳɱ���</td>
	<td  width="2%">ʩ���ɱ��˹���</td>
	<td  width="2%">�ٲ��Ϸ�</td>
	<td  width="2%">���˹���</td>
	<td  width="2%">ʵ����Ʒ�</td>
	<td  width="2%">��Ʒ���ɱ���</td>
	<td  width="2%">����Ʒ����</td>
	<td  width="1%">�������</td>
	<td  width="1%">��������Э����</td>
	<td  width="1%">�������</td>
	<td  width="1%">����������</td>
	<td  width="3%">����������˵��</td>
	<td  width="1%">��ͬ��ˮ����</td>
	<td  width="1%">��ͬ��ˮ�������</td>
	<td  width="1%">��ʩ���鳤ˮ��ɱ�</td>
	<td  width="1%">Զ�̷ѽ��</td>
	<td  width="1%">Զ�̷ѱ���</td>
	<td  width="1%">��ʩ���鳤Զ�̷�</td>
	<td  width="1%">ʩ���鳤�ɱ��ϼƽ��</td>
	<td  width="1%">�۹����ʱ������</td>
	<td  width="1%">�۹����ʱ���</td>
	<td  width="1%">�۹���Ԥ֧</td>
	<td  width="1%">�۷��ձ�֤�����</td>
	<td  width="1%">�۷��ձ�֤��</td>
	<td  width="1%">ʩ���鳤��Ϣ����</td>
	<td  width="1%">���ϳɱ�</td>
	<td  width="1%">���ϴ�����</td>
	<td  width="1%">���ϲ����ۿ�</td>
	<td  width="1%">�е��������ٽ��</td>
	<td  width="1%">��ʩ���鳤��������</td>
	<td  width="3%">��ʩ���鳤��������˵��</td>
	<td  width="1%">������������</td>
	<td  width="1%">ʵ��֧��ʩ���鳤���</td>
	<td  width="1%">����״̬</td>
	<td  width="1%">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="1%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">¼�벿��</td>
	<td  width="451%">��ע</td>
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